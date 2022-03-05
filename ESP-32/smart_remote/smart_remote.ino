#include <ESPAsyncWebServer.h>
#include <WiFi.h>
#include <IRremote.hpp>
#include <Preferences.h>
#include <ESPmDNS.h>

//server object
AsyncWebServer server(80);

//preferences object
Preferences preferences;

//pin to reset wifi credentials
const int resetButton = 2;

//state to determine if reset button has been pressed
int state = 0;

//time at which the reset button was pressed
unsigned long buttonTimer = 0;

void setup() {
  //begin serial, irsender, and preferences (for wifi credentials)
  Serial.begin(115200);
  IrSender.begin();
  preferences.begin("remote", false);

  //initalize reset button as an input
  pinMode(resetButton, INPUT);

  //if there is no ssid and credentials saved, then get the credentials
  if (preferences.getString("ssid", "") == "" & preferences.getString("password", "") == "") {
    get_credentials();
  }

  //otherwise connect to wifi
  else {
    wifi_connect();
  }
}

void loop() {
  //if reset button is initally pressed, set buttonTimer to the current time and set the state=1 so this portion doesnt rerun
  if (digitalRead(resetButton) == HIGH && state == 0) {
    buttonTimer = millis();
    state = 1;
  }

  //if reset button is held for 5 seconds, then reset state and erase wifi credentials
  if (digitalRead(resetButton) == HIGH & ((millis() - buttonTimer) > (5 * 1000)) & state == 1) {
    state = 0;
    resetWifiCredentials();
  }

  //otherwise just reset state so user can restart this process
  else if (((millis() - buttonTimer) > (5 * 1000)) & state == 1) {
    state = 0;
  }
}

//opens an AP and sets up a route to allow for wifi credentials to come in
void get_credentials() {
  //opens access point and prints IP
  WiFi.softAP("ESP-32", "password");
  Serial.println(WiFi.softAPIP());

  //sets up route at /connect
  server.on("/connect", HTTP_GET, [&preferences] (AsyncWebServerRequest * request) {
    //if ssid and password parameters are defined
    if (request->hasParam("ssid") & request->hasParam("password")) {
      //get ssid and password
      const String ssid = request->getParam("ssid")->value();
      const String password = request->getParam("password")->value();

      //send okay
      request->send(200, "text/plain", "OK");
      delay(20);

      //save ssid and password
      preferences.putString("ssid", ssid);
      preferences.putString("password", password);

      //close preferences and server
      preferences.end();
      server.end();

      //restart ESP
      ESP.restart();
    }
    //otherwise return and error
    else {
      Serial.println("error");
      request->send(404);
    }

  });
  //begin server
  server.begin();
}

//connect to wifi and set up routes to get commands at
int wifi_connect() {
  //load wifi credentials
  String ssid = preferences.getString("ssid", "");
  String password = preferences.getString("password", "");

  //close preferences
  preferences.end();

  //connect to wifi
  WiFi.begin(ssid.c_str(), password.c_str());

  //wait for wifi to connect or for reset button to be pressed (cancelling this process)
  while (WiFi.status() != WL_CONNECTED ) {
    //if reset button is pressed, set state and set the current time and return 0
    if (digitalRead(resetButton) == HIGH) {
      state = 1;
      buttonTimer = millis();
      return 0;
    }

    //otherwise wait for connection
    Serial.println("Waiting for connection");
    delay(1500);
  }
  //print ip address
  Serial.println(WiFi.localIP());

  //setup mdns so one can use smart-remote.local in their browser instead of the ip
  //Not supported on android!!!
  if (MDNS.begin("smart-remote")) {
    Serial.println("smart-remote.local");
  }

  //setup route to receive commands at
  server.on("/send", HTTP_GET, [] (AsyncWebServerRequest * request) {
    //send a specific code
    if (request->hasParam("code")) {
      String code = request->getParam("code")->value();
      unsigned long code2 = strtoul(code.c_str(), NULL, 16);
      request->send(200, "text/plain", "OK");

      Serial.println("");
      Serial.print("Code in HEX: ");
      Serial.println(code);

      Serial.println("");
      Serial.print("Code in Decimal: ");
      Serial.println(code2);

      Serial.println("");
      Serial.print("Sent code: ");
      Serial.println(code);

      IrSender.sendNECRaw(code2, 0);
    }
    //send a code from a list of codes (work in progress)
    else if (request->hasParam("type") & request->hasParam("brand") & request->hasParam("model") & request->hasParam("command")) {
      request->send(200, "text/plain", "OK");
    }
    //otherwise send an error back
    else {
      request->send(404);
    }
  });

  //begin server
  server.begin();

  //wait a little bit for connection to becomne steady
  Serial.println("Configuring...");
  delay(10000);
  Serial.println("Done!");
  return 1;
}

//reset wifi credentials
void resetWifiCredentials() {
  //open preferences
  preferences.begin("remote", false);

  //delete everything
  preferences.clear();

  //close preferences
  preferences.end();

  //restart the esp
  ESP.restart();
}

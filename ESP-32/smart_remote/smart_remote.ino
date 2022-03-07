#include <ESPAsyncWebServer.h>
#include <WiFi.h>
#include <IRremote.hpp>
#include <Preferences.h>
#include <ESPmDNS.h>

//server object
AsyncWebServer server(80);

//preferences object
Preferences preferences;
Preferences codes;

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
  preferences.begin("credentials", false);

  //initalize reset button as an input
  pinMode(resetButton, INPUT);

  get_codes();

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

      //save ssid and password
      preferences.putString("ssid", ssid);
      preferences.putString("password", password);

      //close preferences and server
      preferences.end();
      server.end();

      //ok
      request->send(200, "text/plain", "OK");

      //restart ESP
      ESP.restart();
    }
    //otherwise return and error
    else {
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

  if (ssid == "x") {
    ssid = "DESKTOP-ODNF2ME 2182";
  }

  if (password == "y") {
    password = "4(136yQ2";
  }

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

  //setup route to receive NEC commands at (LSB first)
  server.on("/send", HTTP_GET, [] (AsyncWebServerRequest * request) {

    //send a specific code
    if (request->hasParam("code")) {
      //get code
      String code = request->getParam("code")->value();
      //cast as unsigned long
      unsigned long code2 = strtoul(code.c_str(), NULL, 16);

      //print
      Serial.println("");
      Serial.print("Sent code: ");
      Serial.println(code);

      //send
      IrSender.sendNECRaw(code2, 0);

      //ok
      request->send(200, "text/plain", "OK");
    }

    //send a code from a list of codes (work in progress)
    else if (request->hasParam("type") & request->hasParam("brand") & request->hasParam("model") & request->hasParam("command")) {
      //get type, brand, model, and command
      String type = request->getParam("type")->value();
      String brand = request->getParam("brand")->value();
      String model = request->getParam("model")->value();
      String command = request->getParam("command")->value();

      //create query
      String query = type + "_" + brand + "_" + model + "_" + command;

      //retrieve code
      codes.begin("IR_CODES", true);

      String string_hex_code = codes.getString(query.c_str(), "Not found");

      codes.end();

      //print
      Serial.println("");
      Serial.print("Sent: ");
      Serial.println(string_hex_code);

      //send with appropriate protocol
      //lg (NEC)
      if (brand == "lg") {
        //cast code as unsigned long
        unsigned long hex_code = strtoul(string_hex_code.c_str(), NULL, 16);

        //send
        IrSender.sendNECRaw(hex_code, 0);

        //ok
        request->send(200, "text/plain", "OK");
      }
      //samsung
      else if (brand == "ss") {
        //get address and command
        //length of hex code string
        int len = string_hex_code.length() - 1;

        //store address and command
        char address_char [] = {string_hex_code[len - 3], string_hex_code[len - 2], string_hex_code[len - 1], string_hex_code[len], '\0'};
        char command_char [] = {string_hex_code[4], string_hex_code[5], '\0'};

        String address_string = String(address_char);
        String command_string = String(command_char);

        //convert to unsigned long int
        uint16_t address_code = strtol(address_string.c_str(), NULL, 16);
        uint8_t command_code = strtol(command_string.c_str(), NULL, 16);

        //send
        IrSender.sendSamsung(address_code, command_code, 0);

        //ok
        request->send(200, "text/plain", "OK");
      }
      else {
        //error
        request->send(404);
      }


    }
    //otherwise send an error back
    else {
      //error
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
  preferences.begin("credentials", false);

  //delete everything
  preferences.clear();

  //close preferences
  preferences.end();

  //restart the esp
  ESP.restart();
}

void get_codes() {
  codes.begin("IR_CODES", false);
  codes.clear();

  //LG codes recorded manually...
  //LSB first
  //power
  codes.putString("tv_lg_1_pwr", "0xF708FB04");
  //up
  codes.putString("tv_lg_1_up", "0xBF40FB04");
  //down
  codes.putString("tv_lg_1_dwn", "0xBE41FB04");
  //left
  codes.putString("tv_lg_1_lft", "0xF807FB04");
  //right
  codes.putString("tv_lg_1_rht", "0xF906FB04");
  //ok
  codes.putString("tv_lg_1_ok", "0xBB44FB04");
  //volume up
  codes.putString("tv_lg_1_vu", "0xFD02FB04");
  //volume down
  codes.putString("tv_lg_1_vd", "0xFC03FB04");
  //settings
  codes.putString("tv_lg_1_stgs", "0xBC43FB04");
  //source
  codes.putString("tv_lg_1_src", "0xF40BFB04");
  //back
  codes.putString("tv_lg_1_bck", "0xD728FB04");


  /*
    //same codes that I read in above...
    //https://tasmota.github.io/docs/Codes-for-IR-Remotes/#ir-codes-tv-lg-55uh8509
    //LSB first
    //20DF10EF (MSB first)
    codes.putString("tv_lg_2_pwr", "0xF708FB04");
    //20DF02FD (MSB first)
    codes.putString("tv_lg_2_up", "0xBF40FB04");
    //20DF827D (MSB first)
    codes.putString("tv_lg_2_dwn", "0xBE41FB04");
    //20DFE01F (MSB first)
    codes.putString("tv_lg_2_lft", "0xF807FB04");
    //20DF609F (MSB first)
    codes.putString("tv_lg_2_rht", "0xF906FB04");
    //20DF22DD (MSB first)
    codes.putString("tv_lg_2_ok", "0xBB44FB04");
    //20DF40BF (MSB first)
    codes.putString("tv_lg_2_vu", "0xFD02FB04");
    //20DFC03F (MSB first)
    codes.putString("tv_lg_2_vd", "0xFC03FB04");
    //20DFC23D (MSB first)
    codes.putString("tv_lg_2_stgs", "0xBC43FB04");
    //20DFD02F (MSB first)
    codes.putString("tv_lg_2_src", "0xF40BFB04");
    //20DF14EB (MSB first)
    codes.putString("tv_lg_2_bck", "0xD728FB04");
  */

  //https://github.com/lepiaf/IR-Remote-Code
  //LSB first
  //E0E040BF (MSB first)
  codes.putString("tv_ss_1_pwr", "0xFD020707");
  //E0E006F9 (MSB first)
  codes.putString("tv_ss_1_up", "0x9F600707");
  //E0E08679 (MSB first)
  codes.putString("tv_ss_1_dwn", "0x9E610707");
  //E0E0A659 (MSB first)
  codes.putString("tv_ss_1_lft", "0x9A650707");
  //E0E046B9 (MSB first)
  codes.putString("tv_ss_1_rht", "0x9D620707");
  //E0E016E9 (MSB first)
  codes.putString("tv_ss_1_ok", "0x97680707");
  //E0E0E01F (MSB first)
  codes.putString("tv_ss_1_vu", "0xF8070707");
  //E0E0D02F (MSB first)
  codes.putString("tv_ss_1_vd", "0xF40B0707");
  //E0E0D22D (MSB first)
  codes.putString("tv_ss_1_stgs", "0xB44B0707");
  //E0E0807F (MSB first)
  codes.putString("tv_ss_1_src", "0xFE010707");
  //E0E01AE5 (MSB first)
  codes.putString("tv_ss_1_bck", "0xA7580707");

  //samsung speaker codes recorded manually...
  //LSB first
  codes.putString("spkr_ss_1_pwr", "0xE11E2C2C");
  codes.putString("spkr_ss_1_vu", "0xE8172C2C");
  codes.putString("spkr_ss_1_vd", "0xE9162C2C");
  codes.end();
}

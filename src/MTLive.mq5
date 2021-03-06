#property copyright     "brajine@metatrader.live"
#property link          "http://metatrader.live"
#property description   "MetaTrader.live client"
#property description   "Stream account data to metatrader.live"
#define   VERSION       "1.0"
#property version       VERSION

//+------------------------------------------------------------------------------+
//| Streaming data is available at http://metatrader.live/accounts/{myPage}/view |
//|       JSON API is available at http://metatrader.live/accounts/{myPage}/json |
//|  WebSocket API is available at http://metatrader.live/accounts/{myPage}/ws   |
//+------------------------------------------------------------------------------+

// Page name is occupied ONLY when other EA streams to this particular page name and may be released later
// Only [a-z0-9_-] characters are allowed, 1 to 32 characters long
input string   myPage  = "test";           // Page name

// Update frequency
enum Updates {
   oneMinute = 1,
   oneSecond = 2,
};
input Updates updateFreq = oneMinute;

// Set SendAccountInfo to false to prevent sending any Account information to server
input bool SendAccountInfo = true;

// Each particular parameter may be switched off to prevent sending
#define SEND_NAME          true
#define SEND_LOGIN         true
#define SEND_BALANCE       true
#define SEND_EQUITY        true
#define SEND_MARGIN        true
#define SEND_FREEMARGIN    true
#define SEND_MARGINLEVEL   true
#define SEND_PROFITTOTAL   true
#define SEND_SERVER        true
#define SEND_COMPANY       true

string Ip = "metatrader.live";
int Port = 8181;

#include "MTLive.mqh"

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

void OnInit() {
   MTLive::Init(Ip, Port);
}

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

void OnTimer() {
   MTLive::Update();
}

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

void OnDeinit(const int reason) {
   MTLive::DeInit();
}

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

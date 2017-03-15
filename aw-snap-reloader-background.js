// Inspiration for this extension:
// http://zerodeveloper.tumblr.com/post/67664299242/chrome-extension-reload-tab-after-crash
// and
// https://github.com/unclespode/ohnoyoudidnt

// Different ways to test crashes and other problems in Chrome/Chromium:
// In Chrome/Chromium see chrome://about under "For debug", currenlty
// the following options are available:
// chrome://badcastcrash/
// chrome://crash/
// chrome://crashdump/
// chrome://kill/
// chrome://hang/
// chrome://shorthang
// chrome://gpuclean/
// chrome://gpucrash/
// chrome://gpuhang/
// chrome://memory-exhaust/
// chrome://ppapiflashcrash/
// chrome://ppapiflashhang/
// chrome://quit/
// chrome://restart/
//
// Another option is to open the developer tools on a tab that should be
// crashed and in the JavaScript console type:
//
// var memoryHog = "more"; while(true) {memoryHog = memoryHog + "andMore";}
//
// This code will consume so much memory that the tab will crash

// About reloading of tabs; see: https://developer.chrome.com/extensions/tabs
// chrome.tabs.reload(integer tabId, object reloadProperties, function callback)
//   tabId (integer optional): The ID of the tab to reload;
//         defaults to the selected tab of the current window.
//   reloadProperties (object optional): bypassCache (boolean optional): Whether
//         using any local cache. Default is false.
//   callback (function optional): If you specify the callback parameter,
//         it should be a function that looks like this: function() {...};
//
// For the use case of reloading a kiosk app or tabs that the user is using
// the default of calling chrome.tabs.reload() is best

var tabSuccessCount = {}; // store of succesful probe calls
var tabUnresponsiveCount = {}; // store of probe calls that got stuck in limbo
// Interval between checks, do not make this too short (
// less than 1 second seems unwise, better no less than
// 2 seconds) since it is also used to determine if a
// tab is unresponsive
var checkInterval = 10000; // in milliseconds
var tabsChecked = {}; // store for arrays of tab-ids that were checked
var checkIndex = 0; // index of current array of checked tab-ids
var nrTabs = 0; // current number of tabs

function reloadTabIfNeeded(tab) {
  return function(result) {
    if (tabCrashed()) {
      console.log("Crashed tab: title=" + (tab.title || "") + " id=" + tab.id +
                  " index=" + tab.index.toString() + " windowId=" + tab.windowId.toString() +
                  " sessionId=" + (tab.sessionId || "").toString() +
                  " highlighted=" + tab.highlighted.toString() + " active=" + tab.active.toString());
      if (tabShouldBeReloaded(tab)) {
        console.log("Reload tab:" + tab.id.toString());
        chrome.tabs.reload(tab.id);
      }
    } else {
      registerSuccessfulNoOp(tab);
    }
    tabsChecked[checkIndex].push(tab.id);
  };
}

function tabShouldBeReloaded(tab) {
  // Reload if at least one sucessful no-op has occurred.
  // This might be too causious but ensures the tab was working
  // before it crashed
  // this also ensures that we do not reload a tab that takes a long
  // time to load (being unresponsive whilst doing so)
  return tabSuccessCount[tab.id] > 0;
}

function registerSuccessfulNoOp(tab) {
  if ((tabSuccessCount[tab.id] || null) === null) {
    tabSuccessCount[tab.id] = 0;
  }
  tabSuccessCount[tab.id] += 1;
  tabUnresponsiveCount[tab.id] = 0;
}

function registerUnresponsive(tab) {
  if ((tabUnresponsiveCount[tab.id] || null) === null) {
    tabUnresponsiveCount[tab.id] = 0;
  }
  tabUnresponsiveCount[tab.id] += 1;
}

function tabCrashed() {
  // The crux of finding a crashed tab:
  // If an operation (even a no-op) is executed on a crashed tab an error
  // is reported which is available as the chrome.runtime.lastError
  // The error incorrectly reports the tab was closed instead of the fact that the
  // tab does not respond.
  return chrome.runtime.lastError && chrome.runtime.lastError.message === "The tab was closed.";
}

function checkTab(thisTab) {
  if (relevantTab(thisTab)) {
    // Perform a no-op as a probe to find if the tab reponds
    chrome.tabs.executeScript(thisTab.id, {
      // To find crashed tabs probing with a no-op is enough
      // code: "null;"
      // To find unresponsive tabs probing with some operation
      // that takes CPU-cycles is needed
      code: "1 + 1;"
    }, reloadTabIfNeeded(thisTab));
  }
}

function relevantTab(tab){
  // Only check tabs that have finished loading
  // and that use the http or https protocol.
  // This ignores tabs like chrome://...
  // return tab.url.substring(0, 4) == "http" && tab.status == "complete";
  // This makes testing this extension more difficult, to test use
  // the line below
  return tab.status == "complete";
}

function reloadUnresposiveTabs(index, nrTabs, tabs) {
  if (nrTabs === tabs.length && nrTabs > tabsChecked[index].length) {
    var nrTabsToFind = nrTabs - tabsChecked[index].length;
    console.log("Found " + nrTabsToFind.toString() + " unresponsive tabs");
    for (var j = 0; j < nrTabs && nrTabsToFind > 0; j += 1) {
      if (tabsChecked[index].indexOf(tabs[j].id) == -1) {
        registerUnresponsive(tabs[j]);
        if (tabShouldBeReloaded(tabs[j])) {
          console.log("Reload unresponsive tab:" + tabs[j].id.toString());
          // Reloading an unresponsive tab does not work
          // chrome.tabs.reload(tabs[j].id);
          // Therefore a new tab is created with the url of the old tab
          // and the unresponsive tab is removed.
          // Setting the new tab as active is mainly aimed at kiosk-like applications
          chrome.tabs.create({url: tabs[j].url, active: true}, function(tab){
            console.log("Created new tab: id=" + tab.id.toString() + " title=" + (tab.title || "") + " url=" + (tab.url || ""));
          });
          chrome.tabs.remove(tabs[j].id, function(){
            console.log("Removed unresponsive tab:" + tabs[j].id.toString());
          });
        }
        nrTabsToFind -= 1;
      }
    }
  }
}

function checkTabs(tabs) {
  // check for unresponsive tabs by checking the results of
  // the previous round of checkTab calls
  // NOTE: it is assumed all tabs have been checked (all callbacks
  // initiated in the previous checkTabs call have ended (apart
  // form the ones that were done on unresponsive tabs)). The
  // checkInterval has to be long enough to make this a "certainty"
  if (nrTabs > 0) {
    reloadUnresposiveTabs(checkIndex, nrTabs, tabs);
  }

  // roll the checkIndex around after 10 iterations
  checkIndex = checkIndex > 9 ? 0 : (checkIndex + 1);
  nrTabs = tabs.length;
  tabsChecked[checkIndex] = [];
  for (var i = 0; i < tabs.length; i += 1) {
    checkTab(tabs[i]);
  }
}

// Reset the count for tabs that are closed or that change
function tabChanged(tabId, changeInfo, tab) {
  console.log("Resetting Stats for tab: id=" + tabId.toString() + " title=" +
              (tab !== undefined ? tab.title : ""));
  tabSuccessCount[tabId] = 0;
  tabUnresponsiveCount[tabId] = 0;
}

setInterval(function() {
  chrome.tabs.query({}, checkTabs);
}, checkInterval);

// If the tab reloads, reset stats
chrome.tabs.onUpdated.addListener(tabChanged);
chrome.tabs.onRemoved.addListener(tabChanged);

// src: https://gist.github.com/Young-Lord/bcb30d29ecef593ac77120317c897401

/*
Install Frida: uv tool install frida-tools

Add userscript: 

// ==UserScript==
// @name         Foxit Linux login
// @namespace    http://tampermonkey.net/
// @version      2025-10-15
// @description  Redirect window.external.dispatchFun to console.log for Foxit PDF Editor Linux
// @author       LY
// @match        https://account.foxitsoftware.cn/site/plugin-sign-in*
// @grant        unsafeWindow
// @run-at       document-begin
// ==/UserScript==

(function() {
    function fakeDispatchFun() {
        var arg = Array.from(arguments);
        arg.unshift("CalledDispatchFun!!!");
        return console.log.apply(window.console, arg);
    }
    window.external.dispatchFun = fakeDispatchFun
})();


Run /opt/apps/com.foxit.foxitpdfeditor/files/Activation , navigate to Activation page, click Sign In
Find m_csLoginURL  "https://account.foxitsoftware.cn/site/plugin-sign-in?from=cpdf_plugin_login&al=en-US&an=Foxit%20PhantomPDF%20for%20Linux&av=12.3.3.0409&cv=2.0.0.0&r=792855360" from stderr
Open it in browser, login and check console for output
  output example:
  CalledDispatchFun!!! ConnectedPDF SetUserIdAndUserToken {"user_id":"xxx","access_token":"xxx","user_email":"xxx@xxx.com","user_password":"","is_remember":1,"user_avatar":"https://pheecws.foxitsoftware.cn/img/gravatar_default.png","user_name":"xxx","first_name":"xxx","last_name":"","user_type":0,"is_enterprise":0,"login_host":"https://cws-cn.connectedpdf.com","login_host_name":"cws-cn.connectedpdf.com","lastlogintime":"Just now","userMobile":"+8612344445555","region":"","region_apilist_host":"","individual_login_host":"https://cws-cn.connectedpdf.com","enterprise_login_host":"https://pheecws.foxitsoftware.cn"}
Copy the JSON part and replace userInfo in the script below
Save the script to ~/frida_hook_act.js
Run the script with frida:
  sudo `which frida` -p `pidof Activation` -l ~/frida_hook_act.js
Close the blank window of Activation, and then click Sign In again, it should auto sign in with the provided user info

*/


var qt5core_module = "libQt5Core.so.5.12.3";

// get string from QString
function convertQStringToString(qStringInput) {
    var toascii = new NativeFunction(Process.getModuleByName(qt5core_module, '_ZNK7QString7toAsciiEv'), 'void', ['pointer', 'pointer']);
    var allocSpace = Memory.alloc(Process.pointerSize);
    toascii(allocSpace, qStringInput);
    var qByteArray = Memory.readPointer(allocSpace);
    var todata = new NativeFunction(Process.getModuleByName(qt5core_module, '_ZN10QByteArray4dataEv'), 'pointer', ['pointer']);
    var str = todata(allocSpace).readCString();
    return str;
}

// create QString
function convertStringToQString(stringInput) {
    var length = stringInput.length;
    console.log("[*] Length of input string: " + length);
    // Get address of QString::fromUtf8_helper
    // _ZN7QString15fromUtf8_helperEPKci
    var fromutf8address = Process.getModuleByName(qt5core_module).getExportByName('_ZN7QString15fromUtf8_helperEPKci');
    if (fromutf8address.isNull()) {
        console.log("[-] fromUtf8_helper not found!");
        return null;
    }
    console.log("[*] fromUtf8_helper address: " + fromutf8address);
    // _ZN7QString15fromUtf8_helperEPKci
    // QString QString::fromUtf8(const char * str, int size = -1)
    // Create a NativeFunction for QString::fromUtf8
    // 'pointer' return type, takes 'pointer' (char*), 'int' (size)
    var fromutf8 = new NativeFunction(fromutf8address, 'pointer', ['pointer', 'pointer', 'int']);
    var cStrPointer = Memory.allocUtf8String(stringInput);
    var retQString = Memory.alloc(Process.pointerSize);
    console.log("[*] address of cStrPointer: " + cStrPointer);
    console.log("[*] address of retQString: " + retQString);
    fromutf8(retQString, cStrPointer, length);
    return retQString;
}


// hook _ZN12HtmlLoginDlg12loadUrlStartEb in libFoxitAccountManagement.so

var HtmlLoginDlgThisPtr = null;

Interceptor.attach(
    Process.getModuleByName("libFoxitAccountManagement.so").getExportByName("_ZN12HtmlLoginDlg12loadUrlStartEb"), {
    onEnter: function (args) {
        console.log("[*] _ZN12HtmlLoginDlg12loadUrlStartEb called");
        HtmlLoginDlgThisPtr = args[0];
    },
    onLeave: function (retval) {
        // call _ZN12HtmlLoginDlg23DoSetUserIdAndUserTokenE7QString
        var DoSetUserIdAndUserToken = new NativeFunction(Process.getModuleByName("libFoxitAccountManagement.so").getExportByName("_ZN12HtmlLoginDlg23DoSetUserIdAndUserTokenE7QString"), 'void', ['pointer', 'pointer']);
        var userInfo = `{"user_id":"xxx","access_token":"xxx","user_email":"xxx@xxx.com","user_password":"","is_remember":1,"user_avatar":"https://pheecws.foxitsoftware.cn/img/gravatar_default.png","user_name":"xxx","first_name":"xxx","last_name":"","user_type":0,"is_enterprise":0,"login_host":"https://cws-cn.connectedpdf.com","login_host_name":"cws-cn.connectedpdf.com","lastlogintime":"Just now","userMobile":"+8612344445555","region":"","region_apilist_host":"","individual_login_host":"https://cws-cn.connectedpdf.com","enterprise_login_host":"https://pheecws.foxitsoftware.cn"}`;
        var qUserInfo = convertStringToQString(userInfo);
        DoSetUserIdAndUserToken(HtmlLoginDlgThisPtr, qUserInfo);
        console.log("[*] DoSetUserIdAndUserToken called with userInfo: " + userInfo);
    }
}
);

// Default name strings
pref ("distribution.about", "GNU IceCat");
pref ("distribution.id", "gnu");
pref ("distribution.version", "1.0");

// I'm feeling Ducky.
pref("keyword.URL", "https://duckduckgo.com/?t=trisquel&q=!+");
pref("browser.search.defaultenginename", "DuckDuckGo");
pref("browser.search.order.1", "DuckDuckGo");
pref("browser.search.defaultenginename", "DuckDuckGo");
pref("browser.search.order.extra.duckduckgo", "DuckDuckGo");
pref("browser.search.showOneOffButtons", false);
pref("browser.search.suggest.enabled",false);
// Disable preconnecting to search engine when clicking on the search bar
pref("network.http.speculative-parallel-limit", 0);

// Release notes and vendor URLs
pref("app.releaseNotesURL", "https://savannah.gnu.org/news/?group=gnuzilla");
pref("app.vendorURL", "https://www.gnu.org/software/gnuzilla/");
pref("app.privacyURL", "http://www.gnu.org/software/gnuzilla/");

// Disable plugin installer
pref("plugins.hide_infobar_for_missing_plugin", true);
pref("plugins.hide_infobar_for_outdated_plugin", true);
pref("plugins.notifyMissingFlash", false);

//https://developer.mozilla.org/en-US/docs/Web/API/MediaSource
//pref("media.mediasource.enabled",true);

//Speeding it up
pref("network.http.pipelining", true);
pref("network.http.proxy.pipelining", true);
pref("network.http.pipelining.maxrequests", 10);
pref("nglayout.initialpaint.delay", 0);

// Disable third party cookies
pref("network.cookie.cookieBehavior", 1);

//privacy.firstparty.isolate
pref("privacy.firstparty.isolate", true);

// Extensions cannot be updated without permission
pref("extensions.update.enabled", false);
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);
pref("intl.locale.requested", "");
// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);
// Prevent EULA dialog to popup on first run
pref("browser.EULA.override", true);
// Don't disable extensions dropped in to a system
// location, or those owned by the application
pref("extensions.autoDisableScopes", 3);
//pref("extensions.enabledScopes", 15);
// Don't display the one-off addon selection dialog when
// upgrading from a version of Firefox older than 8.0
pref("extensions.shownSelectionUI", true);
// Don't call home for blacklisting
pref("extensions.blocklist.enabled", false);

// disable app updater url
pref("app.update.url", "http://127.0.0.1/");

// Startup page
// Set useragent to Firefox compatible
pref("general.useragent.compatMode.icecat",true);
// Spoof the useragent to a generic one
//pref("general.useragent.override", "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/60.0");

//pref ("browser.startup.page" , 3);
//pref ("browser.startup.homepage" , "https://www.gnu.org/software/gnuzilla/");
//pref ("startup.homepage_welcome_url", "https://www.gnu.org/software/gnuzilla/");
pref("startup.homepage_welcome_url", "");
//pref ("startup.homepage_override_url" , "https://www.gnu.org/software/gnuzilla/");
pref("browser.startup.homepage_override.mstone", "ignore");

// Help URL
pref ("app.support.baseURL", "http://libreplanet.org/wiki/Group:IceCat/");
pref ("app.support.inputURL", "https://lists.gnu.org/mailman/listinfo/bug-gnuzilla");
pref ("app.feedback.baseURL", "https://lists.gnu.org/mailman/listinfo/bug-gnuzilla");
pref ("browser.uitour.url", "http://libreplanet.org/wiki/Group:IceCat/Tour");
pref ("plugins.update.url", "https://www.gnu.org/software/gnuzilla/");
pref ("browser.customizemode.tip0.learnMoreUrl", "http://libreplanet.org/wiki/Group:IceCat/Tour");

// Dictionary download preference
pref("browser.dictionaries.download.url", "http://dictionaries.mozdev.org/");
pref("browser.search.searchEnginesURL", "http://mycroft.mozdev.org/");
// Enable Spell Checking In All Text Fields
pref("layout.spellcheckDefault", 2);

// Apturl preferences
pref("network.protocol-handler.app.apt","/usr/bin/apturl");
pref("network.protocol-handler.warn-external.apt",false);
pref("network.protocol-handler.app.apt+http","/usr/bin/apturl");
pref("network.protocol-handler.warn-external.apt+http",false);
pref("network.protocol-handler.external.apt",true);
pref("network.protocol-handler.external.apt+http",true);

// Privacy & Freedom Issues
// https://webdevelopmentaid.wordpress.com/2013/10/21/customize-privacy-settings-in-mozilla-firefox-part-1-aboutconfig/
// https://panopticlick.eff.org
// http://ip-check.info
// http://browserspy.dk
// https://wiki.mozilla.org/Fingerprinting
// http://www.browserleaks.com
// http://fingerprint.pet-portal.eu
pref("privacy.donottrackheader.enabled", true);
pref("privacy.donottrackheader.value", 1);
pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
pref("browser.safebrowsing.enabled", false);
pref("browser.safebrowsing.downloads.remote.enabled", false);
pref("browser.safebrowsing.malware.enabled", false);
pref("services.sync.privacyURL", "https://www.gnu.org/software/gnuzilla/");
pref("social.enabled", false);
pref("social.remote-install.enabled", false);
pref("datareporting.policy.dataSubmissionEnabled", false);
pref("datareporting.healthreport.uploadEnabled", false);
pref("datareporting.healthreport.about.reportUrl", "127.0.0.1");
pref("datareporting.healthreport.documentServerURI", "127.0.0.1");
pref("healthreport.uploadEnabled", false);
pref("social.toast-notifications.enabled", false);
pref("datareporting.policy.dataSubmissionEnabled", false);
pref("datareporting.healthreport.service.enabled", false);
pref("browser.slowStartup.notificationDisabled", true);
pref("network.http.sendRefererHeader", 2);
pref("network.http.referer.spoofSource", true);
// We don't want to send the Origin header
pref("network.http.originextension", false);
//http://grack.com/blog/2010/01/06/3rd-party-cookies-dom-storage-and-privacy/
//pref("dom.storage.enabled", false);
pref("dom.event.clipboardevents.enabled",false);
pref("network.prefetch-next", false);
pref("network.dns.disablePrefetch", true);
pref("network.http.sendSecureXSiteReferrer", false);
pref("toolkit.telemetry.enabled", false);
pref("toolkit.telemetry.server", "");
pref("experiments.manifest.uri", ""); 
pref("toolkit.telemetry.unified", false);
// Do not tell what plugins do we have enabled: https://mail.mozilla.org/pipermail/firefox-dev/2013-November/001186.html
pref("plugins.enumerable_names", "");
pref("plugin.state.flash", 0);
// Do not autoupdate search engines
pref("browser.search.update", false);
// Warn when the page tries to redirect or refresh
//pref("accessibility.blockautorefresh", true);
pref("dom.battery.enabled", false);
pref("device.sensors.enabled", false);
pref("camera.control.face_detection.enabled", false);
pref("camera.control.autofocus_moving_callback.enabled", false);
pref("network.http.speculative-parallel-limit", 0);
// No search suggestions
pref("browser.urlbar.userMadeSearchSuggestionsChoice", true);
pref("browser.search.suggest.enabled", false);
// Always ask before restoring the browsing session
pref("browser.sessionstore.max_resumed_crashes", 0);
// Disable shield/heartbeat
pref("extensions.shield-recipe-client.enabled", false);
// Don't download ads for the newtab page
pref("browser.newtabpage.directory.source", "");
pref("browser.newtabpage.directory.ping", "");
pref("browser.newtabpage.introShown", true);
// Disable home snippets
pref("browser.aboutHomeSnippets.updateUrl", "");
// Always ask before restoring the browsing session
pref("browser.sessionstore.max_resumed_crashes", 0);
// Disable tracking protection by default, as it makes automated connections to fetch lists
pref("browser.safebrowsing.provider.mozilla.updateURL", "");
pref("privacy.trackingprotection.enabled", false);
pref("privacy.trackingprotection.pbmode.enabled", false);
pref("privacy.trackingprotection.introURL", "https://www.mozilla.org/%LOCALE%/firefox/%VERSION%/tracking-protection/start/");
// Disable geolocation
pref("geo.enabled", false);
pref("browser.search.geoip.url", "");
// Disable captive portal detection
pref("captivedetect.canonicalURL", "");
pref("network.captive-portal-service.enabled", false);
// Disable shield/heartbeat
pref("extensions.shield-recipe-client.enabled", false);
// Canvas fingerprint protection
pref("privacy.resistFingerprinting", true);
// Webgl can be used for fingerprinting
pref("webgl.disabled", true);
// Don't reveal your internal IP when WebRTC is enabled
pref("media.peerconnection.ice.no_host", true);

// Services
pref("gecko.handlerService.schemes.mailto.0.name", "");
pref("gecko.handlerService.schemes.mailto.1.name", "");
pref("handlerService.schemes.mailto.1.uriTemplate", "");
pref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
pref("browser.contentHandlers.types.0.title", "");
pref("browser.contentHandlers.types.0.uri", "");
pref("browser.contentHandlers.types.1.title", "");
pref("browser.contentHandlers.types.1.uri", "");
pref("gecko.handlerService.schemes.webcal.0.name", "");
pref("gecko.handlerService.schemes.webcal.0.uriTemplate", "");
pref("gecko.handlerService.schemes.irc.0.name", "");
pref("gecko.handlerService.schemes.irc.0.uriTemplate", "");

// Disable channel updates
pref("app.update.enabled", false);
pref("app.update.auto", false);
pref("toolkit.telemetry.enabled", false);

// EME
pref("media.eme.enabled", false);
pref("media.eme.apiVisible", false);

// WebRTC
pref("media.peerconnection.enabled", true);
// Don't reveal your internal IP when WebRTC is enabled
pref("media.peerconnection.ice.no_host", true);
pref("media.peerconnection.ice.default_address_only", true);

// Services
pref("gecko.handlerService.schemes.mailto.0.name", "");
pref("gecko.handlerService.schemes.mailto.1.name", "");
pref("handlerService.schemes.mailto.1.uriTemplate", "");
pref("gecko.handlerService.schemes.mailto.0.uriTemplate", "");
pref("browser.contentHandlers.types.0.title", "");
pref("browser.contentHandlers.types.0.uri", "");
pref("browser.contentHandlers.types.1.title", "");
pref("browser.contentHandlers.types.1.uri", "");
pref("gecko.handlerService.schemes.webcal.0.name", "");
pref("gecko.handlerService.schemes.webcal.0.uriTemplate", "");
pref("gecko.handlerService.schemes.irc.0.name", "");
pref("gecko.handlerService.schemes.irc.0.uriTemplate", "");
// https://kiwiirc.com/client/irc.247cdn.net/?nick=Your%20Nickname#underwater-hockey
// Don't call home for blacklisting
pref("extensions.blocklist.enabled", false);
 


pref("font.default.x-western", "sans-serif");

// Preferences for the Get Add-ons panel
pref ("extensions.webservice.discoverURL", "https://gnuzilla.gnu.org/extensions");
pref ("extensions.getAddons.search.url", "https://gnuzilla.gnu.org/extensions");

// Mobile
pref("privacy.announcements.enabled", false);
pref("browser.snippets.enabled", false);
pref("browser.snippets.syncPromo.enabled", false);
pref("identity.mobilepromo.android", "https://f-droid.org/repository/browse/?fdid=org.gnu.icecat&");
pref("browser.snippets.geoUrl", "http://127.0.0.1/");
pref("browser.snippets.updateUrl", "http://127.0.0.1/");
pref("browser.snippets.statsUrl", "http://127.0.0.1/");
pref("datareporting.policy.firstRunTime", 0);
pref("datareporting.policy.dataSubmissionPolicyVersion", 2);
pref("browser.webapps.checkForUpdates", 0);
pref("browser.webapps.updateCheckUrl", "http://127.0.0.1/");
pref("app.faqURL", "http://libreplanet.org/wiki/Group:IceCat/FAQ");

// PFS url
pref("pfs.datasource.url", "http://gnuzilla.gnu.org/plugins/PluginFinderService.php?mimetype=%PLUGIN_MIMETYPE%");
pref("pfs.filehint.url", "http://gnuzilla.gnu.org/plugins/PluginFinderService.php?mimetype=%PLUGIN_MIMETYPE%");

// Geolocation depends on third party services
pref("geo.enabled", false);
pref("geo.wifi.uri", "");

// I'm feeling Ducky.
pref("keyword.URL", "https://duckduckgo.com/html?t=gnu&q=!+");
pref("browser.search.defaultenginename", "DuckDuckGo");
pref("browser.search.order.extra.duckduckgo", "DuckDuckGo");
pref("browser.search.showOneOffButtons", false);
// US specific default (used as a fallback if the geoSpecificDefaults request fails).
pref("browser.search.defaultenginename.US",      "data:text/plain,browser.search.defaultenginename.US=DuckDuckGo");
pref("browser.search.order.US.1",                "data:text/plain,browser.search.order.US.1=DuckDuckGo");
pref("browser.search.order.US.2",                "data:text/plain,browser.search.order.US.2=Google");
pref("browser.search.order.US.3",                "data:text/plain,browser.search.order.US.3=Yahoo");

// Disable Gecko media plugins: https://wiki.mozilla.org/GeckoMediaPlugins
pref("media.gmp-manager.url", "http://127.0.0.1/");
pref("media.gmp-manager.url.override", "data:text/plain,");
pref("media.gmp-manager.url", "");
pref("media.gmp-provider.enabled", false);
// Don't install openh264 codec
pref("media.gmp-gmpopenh264.enabled", false);
pref("media.gmp-eme-adobe.enabled", false);

//Disable middle click content load
//Avoid loading urls by mistake 
pref("middlemouse.contentLoadURL", false);

//Disable heartbeat
pref("browser.selfsupport.url", "");

//Disable Link to FireFox Marketplace, currently loaded with non-free "apps"
pref("browser.apps.URL", "");

//Disable Firefox Hello
pref("loop.enabled",false);

// Use old style preferences, that allow javascript to be disabled
pref("browser.preferences.inContent",false);

// Don't download ads for the newtab page
pref("browser.newtabpage.directory.source", "");
pref("browser.newtabpage.directory.ping", "");
pref("browser.newtabpage.introShown", true);

// Disable home snippets
pref("browser.aboutHomeSnippets.updateUrl", "data:text/html");

// Disable hardware acceleration
//pref("layers.acceleration.disabled", false);
pref("gfx.direct2d.disabled", true);

// Disable SSDP
pref("browser.casting.enabled", false);

//Disable directory service
pref("social.directories", "");

// Crypto hardening
// https://gist.github.com/haasn/69e19fc2fe0e25f3cff5
//General settings
pref("security.tls.unrestricted_rc4_fallback", false);
pref("security.tls.insecure_fallback_hosts.use_static_list", false);
pref("security.tls.version.min", 1);
pref("security.ssl.require_safe_negotiation", false);
pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
pref("security.ssl3.rsa_seed_sha", true);
pref("security.OCSP.enabled", 1);
pref("security.OCSP.require", false); // set to false otherwise it breaks captive portal usage

// Avoid logjam attack
pref("security.ssl3.dhe_rsa_aes_128_sha", false);
pref("security.ssl3.dhe_rsa_aes_256_sha", false);
pref("security.ssl3.dhe_dss_aes_128_sha", false);
pref("security.ssl3.dhe_rsa_des_ede3_sha", false);

// Disable Pocket integration
pref("browser.pocket.enabled", false);
pref("extensions.pocket.enabled", false);

// Do not require xpi extensions to be signed by Mozilla
pref("xpinstall.signatures.required", false);

// Do not show unicode urls https://www.xudongz.com/blog/2017/idn-phishing/
pref("network.IDN_show_punycode", true);

// disable screenshots extension
pref("extensions.screenshots.disabled", true);
// disable onboarding
pref("browser.onboarding.newtour", "performance,private,addons,customize,default");
pref("browser.onboarding.updatetour", "performance,library,singlesearch,customize");
pref("browser.onboarding.enabled", false);

// New tab settings
pref("browser.newtabpage.activity-stream.default.sites", "https://www.trisquel.info/,https://www.gnu.org/,https://www.fsf.org/,https://libreplanet.org/,https://www.wikipedia.org/,https://www.wikinews.org/");
pref("browser.newtabpage.activity-stream.showTopSites",true);
pref("browser.newtabpage.activity-stream.feeds.section.topstories",false);
pref("browser.newtabpage.activity-stream.feeds.snippets",false);
pref("browser.newtabpage.activity-stream.disableSnippets", true);
user_pref("browser.newtabpage.activity-stream.tippyTop.service.endpoint", "");

// Enable xrender
pref("gfx.xrender.enabled",true);

// Disable push notifications 
pref("dom.webnotifications.enabled",false); 
pref("dom.webnotifications.serviceworker.enabled",false); 
pref("dom.push.enabled",false); 

// Disable recommended addons
pref("extensions.htmlaboutaddons.recommendations.enabled", false);
pref("extensions.htmlaboutaddons.discover.enabled", false);

// Disable Firefox Sync toolbar button 
pref("identity.fxaccounts.toolbar.enabled", false);
pref("identity.fxaccounts.enabled", false);

// Disable DoH by default
pref("network.trr.mode", 5);

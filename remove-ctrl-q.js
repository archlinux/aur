// Modified from https://www.reddit.com/r/firefox/comments/kilmm2/restore_ctrlshiftb_library_by_setting_configjs/
// Which is originally made by /u/aveyo
// Then modified by /u/axzxc1236 and /u/panoptigram
try {
	let { classes: Cc, interfaces: Ci, manager: Cm	} = Components;
	const {Services} = Components.utils.import('resource://gre/modules/Services.jsm');
	function ConfigJS() { Services.obs.addObserver(this, 'chrome-document-global-created', false); }
	ConfigJS.prototype = {
		observe: function (aSubject) { aSubject.addEventListener('DOMContentLoaded', this, {once: true}); },
		handleEvent: function (aEvent) {
			let document = aEvent.originalTarget,
				window = document.defaultView,
				location = window.location;
			if (/^(chrome:(?!\/\/(global\/content\/commonDialog|browser\/content\/webext-panels)\.x?html)|about:(?!blank))/i.test(location.href)) {
				if (window._gBrowser) {
					let keyQuit = document.getElementById("key_quitApplication");
					if (keyQuit) keyQuit.remove();
				}
			}
		}
	};
	if (!Services.appinfo.inSafeMode) { new ConfigJS(); }
} catch(ex) {};

 

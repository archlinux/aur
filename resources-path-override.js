'use strict';
try {
	const path = require('path');
	const resolveAppDir = () => {
		if (process.env._APPDIR) {
			return process.env._APPDIR;
		}
		const argv = process.argv || [];
		for (let i = 0; i < argv.length; i++) {
			if (argv[i] === '--app' && i + 1 < argv.length) {
				return path.dirname(argv[i + 1]);
			}
			if (argv[i].startsWith('--app=') && argv[i].length > 6) {
				return path.dirname(argv[i].slice(6));
			}
		}
		return '/usr/lib/@appname@';
	};
	const appDir = resolveAppDir();
	if (process.resourcesPath !== appDir) {
		Object.defineProperty(process, 'resourcesPath', {
			value: appDir,
			writable: false,
			configurable: true,
			enumerable: true,
		});
	}
} catch (e) {
	console.error('[resources-path-override] WARNING: override threw: ' + e.message +
		'; resourcesPath-relative lookups (product.json, application-icons) will fail.');
}
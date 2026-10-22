'use strict';
try {
	const path = require('path');
	const fs = require('fs');
	const resolveAppDir = () => {
		const argv = process.argv || [];
		for (let i = 0; i < argv.length; i++) {
			if (argv[i] === '--app' && i + 1 < argv.length) {
				return path.dirname(argv[i + 1]);
			}
			if (argv[i].startsWith('--app=') && argv[i].length > 6) {
				return path.dirname(argv[i].slice(6));
			}
		}
		const entry = argv[1];
		if (typeof entry === 'string' && entry.startsWith('/usr/lib/')) {
			const m = entry.match(/^\/usr\/lib\/([^/]+)\//);
			if (m) {
				const candidate = '/usr/lib/' + m[1];
				for (const probe of ['app.asar', 'app', 'app.asar.unpacked']) {
					if (fs.existsSync(path.join(candidate, probe))) {
						return candidate;
					}
				}
			}
		}
		if (process.env._APPDIR) {
			return process.env._APPDIR;
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
	if (!process.env.ELECTRON_IS_DEV && !process.env.NODE_ENV) {
		const argv = process.argv || [];
		let appPath = null;
		for (let i = 0; i < argv.length; i++) {
			if (argv[i] === '--app' && i + 1 < argv.length) {
				appPath = argv[i + 1];
				break;
			}
			if (argv[i].startsWith('--app=') && argv[i].length > 6) {
				appPath = argv[i].slice(6);
				break;
			}
		}
		if (appPath) {
			const isAsar = appPath.endsWith('.asar') && fs.existsSync(appPath);
			const isAppDir = fs.existsSync(appPath) && fs.statSync(appPath).isDirectory();
			const isUnpacked = appPath.endsWith('.asar.unpacked') && fs.existsSync(appPath);
			if (isAsar || isAppDir || isUnpacked) {
				console.log('[app-override] packaged app detected, forcing production env');
				process.env.ELECTRON_IS_DEV = '0';
				process.env.NODE_ENV = 'production';
			}
		}
	}
	if (!process.env._APPDIR_NO_FS_REDIRECT) {
		const electronResources = path.join(path.dirname(process.execPath), 'resources');
		if (electronResources !== appDir && fs.existsSync(appDir)) {
			let topLevel = null;
			try {
				topLevel = new Set(fs.readdirSync(appDir));
			} catch (e) {
				topLevel = null;
			}
			const debug = !!process.env._APPDIR_DEBUG;
			if (topLevel) {
				const prefix = electronResources + path.sep;
				const redirect = (p) => {
					if (typeof p !== 'string' || !p.startsWith(prefix)) return p;
					const rel = p.slice(prefix.length);
					if (rel.split(path.sep).includes('..')) return p;
					const first = rel.split(path.sep)[0];
					if (!topLevel.has(first)) return p;
					const target = appDir + path.sep + rel;
					if (debug) console.log('[app-override] fs redirect: ' + p + ' -> ' + target);
					return target;
				};
				const wrap = (obj, name) => {
					const orig = obj[name];
					if (typeof orig !== 'function') return;
					obj[name] = function (p, ...rest) {
						return orig.call(this, redirect(p), ...rest);
					};
				};
				for (const name of [
					'readFile', 'readFileSync', 'existsSync', 'createReadStream',
					'statSync', 'lstatSync', 'accessSync', 'openSync',
					'realpathSync', 'readdirSync', 'opendirSync',
				]) wrap(fs, name);
				for (const name of [
					'readFile', 'stat', 'lstat', 'access', 'open',
					'realpath', 'readdir', 'opendir',
				]) wrap(fs.promises, name);
			}
		}
	}
} catch (e) {
	console.error('[app-override] WARNING: override threw: ' + e.message +
		'; resourcesPath-relative lookups (product.json, application-icons) will fail.');
}
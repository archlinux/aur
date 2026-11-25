'use strict';
try {
	const self = __filename, argv = process.argv || [];
	const j = argv.indexOf('--require');
	if (j !== -1 && argv[j + 1] === self) process.argv.splice(j, 2);
	else { const i = argv.indexOf(self); if (i !== -1) process.argv.splice(i, 1); }
} catch (e) {}
try {
	const path = require('path'), fs = require('fs');
	const argv = process.argv || [], debug = !!process.env._APPDIR_DEBUG;
	const isEntry = (p) => {
		if (typeof p !== 'string' || p.startsWith('--')) return false;
		const base = path.basename(p);
		return base === 'app.asar' || base === 'app';
	};
	const resolveAppDir = () => {
		if (process.env._APPDIR) return process.env._APPDIR;
		for (let i = 0; i < argv.length; i++) {
			if (argv[i] === '--app' && i + 1 < argv.length) return path.dirname(argv[i + 1]);
			if (argv[i].startsWith('--app=') && argv[i].length > 6) return path.dirname(argv[i].slice(6));
		}
		for (let i = 1; i < argv.length; i++) if (isEntry(argv[i])) return path.dirname(argv[i]);
		return null;
	};
	const appDir = resolveAppDir(); if (!appDir) throw new Error('cannot resolve appDir; set _APPDIR explicitly');
	if (debug) console.log('[app-override] appDir=' + appDir);
	if (process.resourcesPath !== appDir) {
		Object.defineProperty(process, 'resourcesPath', {
			value: appDir, writable: false, configurable: true, enumerable: true,
		});
	}
	if (!process.env.ELECTRON_IS_DEV && !process.env.NODE_ENV) {
		for (let i = 1; i < argv.length; i++) {
			if (isEntry(argv[i])) {
				console.log('[app-override] packaged app detected, forcing production env');
				process.env.ELECTRON_IS_DEV = '0', process.env.NODE_ENV = 'production';
				break;
			}
		}
	}
	if (!process.env._APPDIR_NO_FS_REDIRECT) {
		const electronResources = path.join(path.dirname(process.execPath), 'resources');
		if (electronResources !== appDir && fs.existsSync(appDir)) {
			let topLevel = null;
			try { topLevel = new Set(fs.readdirSync(appDir)); } catch (e) { topLevel = null; }
			if (!topLevel) console.warn('[app-override] cannot read appDir entries; fs redirect disabled: ' + appDir);
			else {
				const prefix = electronResources + path.sep;
				const redirect = (p) => {
					if (typeof p !== 'string' || !p.startsWith(prefix)) return p;
					const rel = p.slice(prefix.length), parts = rel.split(path.sep);
					if (parts.includes('..')) return p;
					if (!topLevel.has(parts[0])) return p;
					const target = appDir + path.sep + rel;
					if (debug) console.log('[app-override] fs redirect: ' + p + ' -> ' + target);
					return target;
				};
				const copyStatics = (orig, wrapper) => {
					for (const key of Object.getOwnPropertyNames(orig)) {
						if (key === 'length' || key === 'name' || key === 'prototype') continue;
						try { Object.defineProperty(wrapper, key, Object.getOwnPropertyDescriptor(orig, key)); } catch (e) {}
					}
				};
				const wrap = (obj, name) => {
					const orig = obj[name];
					if (typeof orig !== 'function') return;
					const wrapper = function (p, ...rest) { return orig.call(this, redirect(p), ...rest); };
					copyStatics(orig, wrapper); obj[name] = wrapper;
				};
				for (const name of ['readFile', 'readFileSync', 'existsSync', 'createReadStream', 'statSync', 'lstatSync', 'accessSync', 'openSync', 'realpathSync', 'readdirSync', 'opendirSync']) wrap(fs, name);
				for (const name of ['readFile', 'stat', 'lstat', 'access', 'open', 'realpath', 'readdir', 'opendir']) wrap(fs.promises, name);
				if (typeof fs.realpathSync === 'function' && typeof fs.realpathSync.native !== 'function') {
					try {
						Object.defineProperty(fs.realpathSync, 'native', {
							value: function (p, opts) { return fs.realpathSync(p, opts); },
							writable: true, configurable: true,
						});
					} catch (e) {}
				}
				if (debug) console.log('[app-override] fs redirect installed (' + topLevel.size + ' top-level entries)');
			}
		}
	}
} catch (e) {
	console.error('[app-override] WARNING: override threw: ' + e.message + '; resourcesPath-relative lookups (product.json, application-icons) may fail.');
}

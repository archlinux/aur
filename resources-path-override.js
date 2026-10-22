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
		// 构建期占位符: prepare() sed 将 @appname@ 替换为实际包名。
		// 注意末尾 /resources: gerbil 的生产分支以 resourcesPath/../assets 定位资源,
		// 与 AppImage 原生结构 (squashfs-root/resources + squashfs-root/assets) 同构。
		return '/usr/lib/@appname@/resources';
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
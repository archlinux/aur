#!/usr/bin/env node
// 把 Kimi Work 的区域判定固定为常量，并让资源目录不再依赖系统 Electron 的
// resourcesPath，从而两个版本可以各自安装到独立的 /opt 前缀。
// 用法: node patch-region.js <asar-extract-dir> <china|overseas> <app-name>

const fs = require('fs');
const path = require('path');

const root = process.argv[2];
const region = process.argv[3];
const appName = process.argv[4];

if (!root || !['china', 'overseas'].includes(region) || !appName) {
  console.error('usage: patch-region.js <dir> <china|overseas> <app-name>');
  process.exit(1);
}

const pkgPath = path.join(root, 'package.json');
const pkg = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
pkg.name = appName;
// Electron 用 desktopName 推导 Linux 的 WM_CLASS / Wayland app_id。
// 两版沿用上游的 com.moonshot.kimichat 会被任务栏合并成同一个应用。
pkg.desktopName =
  region === 'china' ? 'kimi-work-cn.desktop' : 'kimi-work-intl.desktop';
fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + '\n');

const mainPath = path.join(root, pkg.main);
let source = fs.readFileSync(mainPath, 'utf8');

// 每个补丁点都要求唯一命中，上游改结构时让构建失败而不是静默跳过。
function replaceOnce(re, replacement, label) {
  const hits = [...source.matchAll(re)];
  if (hits.length !== 1) {
    console.error(`${label}补丁点数量异常: ${hits.length}`);
    process.exit(1);
  }
  source = source.replace(re, replacement);
}

// 1. 区域判定 getter：原实现依次返回手动设置、设备区域和上次生效值。
//    直接固定成常量，后续所有域名/环境判断都会拿到同一个区域。
replaceOnce(
  /function (_0x[0-9a-f]+)\(\) \{\n  if \(_0x[0-9a-f]+\) return _0x[0-9a-f]+;\n  if \(_0x[0-9a-f]+\) return _0x[0-9a-f]+;\n  return _0x[0-9a-f]+;\n\}/g,
  (match, name) => `function ${name}() {\n  return "${region}";\n}`,
  '区域判定函数'
);

// 2. 启动时恢复 RegionState 的种子值。初始化函数会把持久化的
//    manual/lastEffective 读进模块变量，KimiEnv 直接使用 lastEffective 选择
//    域名，不经过上面的 getter；不覆盖这里，zh-CN 机器上的 intl 包仍会被
//    locale 播撒成 china，en-US 机器上的 cn 包会被播撒成 overseas。
replaceOnce(
  /(_0x[0-9a-f]+) = _0x[0-9a-f]+\[_0x[0-9a-f]+\(\d+\)\], (_0x[0-9a-f]+) = _0x[0-9a-f]+\["lastEffective"\];/g,
  (match, manualVar, lastVar) => `${manualVar} = null, ${lastVar} = "${region}";`,
  '区域状态种子'
);

// 3. 默认关闭 launcher 全局快捷键：Linux/Wayland 下注册 Ctrl+Shift+Space 会
//    触发 XDG GlobalShortcuts portal，GNOME 随即弹出 “Add Keyboard Shortcut”。
//    用户仍可在设置里主动开启该项。
replaceOnce(
  /"launcherEnabled": !!\[\], "launcherShortcut": /g,
  '"launcherEnabled": ![], "launcherShortcut": ',
  'launcherEnabled 默认值'
);

// 未写入过设置时原逻辑按 `!== false` 视为开启，必须同时改为仅在显式 true 时开启。
replaceOnce(
  /"launcherEnabled": ([^,\n]+) !== !\[\],/g,
  '"launcherEnabled": $1 === !![],',
  'launcherEnabled 读取逻辑'
);

// 4. 资源路径：Electron 的 process.resourcesPath 指向系统 electron43，
//    这里改为优先读取 KIMI_WORK_RESOURCES（由包装脚本指向独立的 /opt 前缀）。
//    24573 是 3.2.27 混淆字符串表里 "resourcesPath" 的 id。
const resourcesPathId = '24573';
const resourcesPathRe = new RegExp(
  `process\\[(_0x[0-9a-f]+)\\(${resourcesPathId}\\)\\]`,
  'g'
);
const resourcesPathHits = source.match(resourcesPathRe) || [];
if (resourcesPathHits.length === 0) {
  console.error('resourcesPath 补丁点数量异常: 0');
  process.exit(1);
}
source = source.replace(
  resourcesPathRe,
  `(process.env["KIMI_WORK_RESOURCES"] || process[$1(${resourcesPathId})])`
);

// 5. 窗口类名：运行时用配置里的 appId 推导 desktop 文件名并调用
//    app.setDesktopName()，这会覆盖 package.json 的 desktopName，
//    两版沿用同一个 appId 时任务栏会把窗口合并到同一个应用。
//    10689/12514 分别是 3.2.27 字符串表里 "appId" 与 ".desktop" 的 id。
const desktopName =
  region === 'china' ? 'kimi-work-cn.desktop' : 'kimi-work-intl.desktop';
replaceOnce(
  /const (_0x[0-9a-f]+) = _0x[0-9a-f]+\[_0x[0-9a-f]+\(10689\)\] \+ _0x[0-9a-f]+\(12514\);/g,
  `const $1 = "${desktopName}";`,
  'desktopName 运行时'
);

fs.writeFileSync(mainPath, source);
console.log(`patched ${pkg.main}: region=${region}, name=${appName}`);

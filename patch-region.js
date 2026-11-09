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

// 1. 区域判定函数：原实现依次读取手动设置、区域标记和上次生效值。
const marker = 'function _0x2a4383()';
const start = source.indexOf(marker);
if (start < 0) {
  console.error('未找到区域判定函数 _0x2a4383');
  process.exit(1);
}

const open = source.indexOf('{', start);
let depth = 0;
let end = -1;
for (let i = open; i < source.length; i += 1) {
  if (source[i] === '{') depth += 1;
  if (source[i] === '}') {
    depth -= 1;
    if (depth === 0) {
      end = i;
      break;
    }
  }
}
if (end < 0) {
  console.error('区域判定函数结构异常');
  process.exit(1);
}

source =
  source.slice(0, start) +
  `function _0x2a4383() {\n  return "${region}";\n}` +
  source.slice(end + 1);

// 2. 资源路径：Electron 的 process.resourcesPath 指向系统 electron43，
//    这里改为优先读取 KIMI_WORK_RESOURCES（由包装脚本指向独立的 /opt 前缀）。
const needle = '_0x91d9c1 = process["resourcesPath"]';
const hits = source.split(needle).length - 1;
if (hits !== 1) {
  console.error(`resourcesPath 补丁点数量异常: ${hits}`);
  process.exit(1);
}
source = source.replace(
  needle,
  '_0x91d9c1 = (process.env["KIMI_WORK_RESOURCES"] || process["resourcesPath"])'
);

// 3. 窗口类名：运行时用配置里的 appId 推导 desktop 文件名并调用
//    app.setDesktopName()，这会覆盖 package.json 的 desktopName，
//    两版沿用同一个 appId 时任务栏会把窗口合并到同一个应用。
const desktopNeedle = 'const _0x1bf09b = _0x1c0ac9["appId"] + ".desktop";';
const desktopHits = source.split(desktopNeedle).length - 1;
if (desktopHits !== 1) {
  console.error(`desktopName 补丁点数量异常: ${desktopHits}`);
  process.exit(1);
}
const desktopName =
  region === 'china' ? 'kimi-work-cn.desktop' : 'kimi-work-intl.desktop';
source = source.replace(
  desktopNeedle,
  `const _0x1bf09b = "${desktopName}";`
);

fs.writeFileSync(mainPath, source);
console.log(`patched ${pkg.main}: region=${region}, name=${appName}`);

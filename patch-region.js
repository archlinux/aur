#!/usr/bin/env node
// 将 Kimi Code 的区域判定函数替换为固定常量，并隔离两个版本的配置目录。
// 用法: node patch-region.js <asar-extract-dir> <mainland-cn|global> <app-name>

const fs = require('fs');
const path = require('path');

const root = process.argv[2];
const region = process.argv[3];
const appName = process.argv[4];

if (!root || !['mainland-cn', 'global'].includes(region) || !appName) {
  console.error('usage: patch-region.js <dir> <mainland-cn|global> <app-name>');
  process.exit(1);
}

// 1. 配置目录隔离：Electron 用 package.json 的 name 推导 userData 路径，
//    国际版和国内版共用同一名称会互相覆盖登录态。
const pkgPath = path.join(root, 'package.json');
const pkg = JSON.parse(fs.readFileSync(pkgPath, 'utf8'));
pkg.name = appName;
// Electron 在 Linux 上用 desktopName 推导 WM_CLASS（Wayland 的 app_id 也用它），
// 两版沿用上游的 kimi-code.desktop 会导致窗口被任务栏合并到同一个应用。
pkg.desktopName =
  region === 'mainland-cn' ? 'kimi-code-cn.desktop' : 'kimi-code-intl.desktop';
fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2) + '\n');

// 2. 区域判定函数 Ei 的原始实现按环境变量、登录态、区域标记和默认值依次判定，
//    这里整体替换为常量。打包产物里有多个同名压缩函数 Ei，必须以同文件内的
//    $ie 与 OAuth 变量一起定位。
const candidates = [];
for (const file of fs.readdirSync(path.join(root, 'out'))) {
  if (!file.endsWith('.cjs') && !file.endsWith('.js')) continue;
  const filePath = path.join(root, 'out', file);
  const source = fs.readFileSync(filePath, 'utf8');
  if (
    source.includes('function Ei(e){') &&
    source.includes('function $ie(') &&
    source.includes('KIMI_CODE_OAUTH_HOST')
  ) {
    candidates.push({ filePath, source });
  }
}

if (candidates.length !== 1) {
  console.error(`区域判定函数 Ei 候选数量异常: ${candidates.length}`);
  process.exit(1);
}

const target = candidates[0];

const start = target.source.indexOf('function Ei(e){');
const next = target.source.indexOf('function $ie(', start);
if (next < 0) {
  console.error('未找到 Ei 之后的 $ie 函数，补丁位置异常');
  process.exit(1);
}

const replacement = `function Ei(e){return{region:\`${region}\`,source:\`env\`}}`;
const patched =
  target.source.slice(0, start) + replacement + target.source.slice(next);

fs.writeFileSync(target.filePath, patched);
console.log(`patched ${path.basename(target.filePath)}: region=${region}, name=${appName}`);

// 3. 国内版改用独立的自定义协议：两版都注册 kimi-code:// 时，xdg 无法确定
//    由哪个包处理深链，打开链接会落到随机一版。这里把注册常量与回调协议
//    判断一起改成 kimi-code-cn，与国际版彻底分离。
if (region === 'mainland-cn') {
  const outDir = path.join(root, 'out');
  let schemePatched = 0;
  let protocolPatched = 0;
  for (const file of fs.readdirSync(outDir)) {
    if (!file.endsWith('.cjs') && !file.endsWith('.js')) continue;
    const filePath = path.join(outDir, file);
    let source = fs.readFileSync(filePath, 'utf8');
    const gns = source.split('const gn=`kimi-code`').length - 1;
    const protocols = source.split('protocol===`kimi-code:`').length - 1;
    if (gns === 0 && protocols === 0) continue;
    source = source
      .split('const gn=`kimi-code`')
      .join('const gn=`kimi-code-cn`')
      .split('protocol===`kimi-code:`')
      .join('protocol===`kimi-code-cn:`');
    fs.writeFileSync(filePath, source);
    schemePatched += gns;
    protocolPatched += protocols;
    console.log(
      `patched ${file}: scheme=kimi-code-cn (${gns} register, ${protocols} check)`
    );
  }
  if (schemePatched !== 1 || protocolPatched === 0) {
    console.error(
      `协议补丁数量异常: register=${schemePatched}, check=${protocolPatched}`
    );
    process.exit(1);
  }
}

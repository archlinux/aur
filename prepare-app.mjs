#!/usr/bin/env node
// 从 macOS 版 app.asar 提取应用目录并做 Linux 运行所需的修补
// 用法: node prepare-app.mjs <app.asar 路径> <输出目录> [icon.icns] [图标输出前缀]
import { createReadStream, existsSync, mkdirSync, openSync, readFileSync, writeFileSync, closeSync, statSync } from "node:fs";
import { dirname, join } from "node:path";

const [asarPath, outDir, icnsPath, iconOutBase] = process.argv.slice(2);
if (!asarPath || !outDir) {
  console.error("usage: node prepare-app.mjs <app.asar> <outdir> [icon.icns] [icon-out-base]");
  process.exit(1);
}

function fail(message) {
  console.error(`prepare-app: ${message}`);
  process.exit(1);
}

// ---- 提取 asar ----
// 布局: 8 字节 pickle 头 + 4 字节 json 长度 + 4 字节填充 + json 目录 + 文件数据区
const fd = openSync(asarPath, "r");
const head = Buffer.alloc(16);
const fs = await import("node:fs");
fs.readSync(fd, head, 0, 16, 0);
const headerSize = head.readUInt32LE(4);
const jsonSize = head.readUInt32LE(12);
const jsonBuf = Buffer.alloc(jsonSize);
fs.readSync(fd, jsonBuf, 0, jsonSize, 16);
const base = 8 + headerSize;
const tree = JSON.parse(jsonBuf.toString("utf8"));

let fileCount = 0;
function extract(node, path) {
  for (const [name, child] of Object.entries(node.files ?? {})) {
    const p = join(path, name);
    if (child.files) {
      mkdirSync(p, { recursive: true });
      extract(child, p);
    } else {
      mkdirSync(dirname(p), { recursive: true });
      if (child.unpacked) {
        // 实体文件在 app.asar.unpacked 目录里，不在 asar 流里
        const src = join(`${asarPath}.unpacked`, p.slice(outDir.length));
        fs.copyFileSync(src, p);
        fs.chmodSync(p, Number(child.mode ?? 0o644) & 0o777);
      } else {
        const buf = Buffer.alloc(Number(child.size));
        fs.readSync(fd, buf, 0, buf.length, base + Number(child.offset));
        writeFileSync(p, buf);
      }
      fileCount++;
    }
  }
}
mkdirSync(outDir, { recursive: true });
extract(tree, outDir);
closeSync(fd);
console.log(`extracted ${fileCount} files to ${outDir}`);

// ---- Linux 运行修补 ----
const mainPath = join(outDir, "main", "main.js");
if (!existsSync(mainPath)) fail(`missing main bundle: ${mainPath}`);
let source = readFileSync(mainPath, "utf8");

function replaceExactlyOnce(marker, replacement, message) {
  const count = source.split(marker).length - 1;
  if (count !== 1) fail(`${message} (匹配 ${count} 次)`);
  source = source.replace(marker, replacement);
}

// 1. resourcesPath 改为可通过环境变量覆盖（系统 electron 下它指向 electron 自己的 resources）
if (!source.includes("process.resourcesPath")) fail("no process.resourcesPath usage found");
source = source.replaceAll(
  "process.resourcesPath",
  "(process.env.COZE_DESKTOP_RESOURCES_PATH??process.resourcesPath)",
);

// 2. 内建更新只发 macOS/Windows 安装包，Linux 上把更新服务整体短路
// shortcut: 标记是压缩后的上游代码文本，上游一换构建就匹配不上，届时重新找 runAutoUpdaterService 入口，when: 每次 bump 版本跑一次冒烟看会不会弹更新
replaceExactlyOnce(
  "async function runAutoUpdaterService(options = {}) {",
  'async function runAutoUpdaterService(options = {}) {if(process.platform==="linux")return;',
  "upstream bundle layout changed; could not patch updater",
);

if (!source.includes("COZE_DESKTOP_RESOURCES_PATH")) fail("patch verification failed: resources override missing");
writeFileSync(mainPath, source);
console.log("patched", mainPath);

// 3. 上游用的是字节定制 Electron（@aha-kit/electron），日志和埋点走 electron 模块上的
// ahaLog/ahaReporter/ahaPerf/ahaDeviceService，官方 Electron 没有这些属性会直接崩，
// 在入口注入空实现
const bootstrapPath = join(outDir, "main", "bootstrap.js");
let bootstrap = readFileSync(bootstrapPath, "utf8");
if (!bootstrap.includes("COZE_AHALOG_STUB")) {
  const stub = `/* COZE_AHALOG_STUB */
try {
  const _e = require("electron");
  const _n = () => {};
  if (_e && !_e.ahaLog) _e.ahaLog = { debug: _n, info: _n, success: _n, warn: _n, error: _n, report: _n };
  if (_e && !_e.ahaReporter) _e.ahaReporter = { init: async () => ({}), report: async () => {} };
  if (_e && !_e.ahaPerf) _e.ahaPerf = {};
  if (_e && !_e.ahaDeviceService) _e.ahaDeviceService = { getDeviceId: async (id) => ({ deviceId: id }) };
} catch {}
`;
  writeFileSync(bootstrapPath, stub + bootstrap);
  console.log("stubbed aha* APIs in", bootstrapPath);
}

// 4. 从 macOS icns 里挑出 PNG 块当图标（icns 里就是裸 PNG 文件拼起来的）
if (icnsPath && iconOutBase) {
  const icns = readFileSync(icnsPath);
  const wanted = new Map([[512, null], [256, null]]);
  for (let off = 8; off + 8 <= icns.length; ) {
    const size = icns.readUInt32BE(off + 4);
    const body = icns.subarray(off + 8, off + size);
    if (body.length > 24 && body.readUInt32BE(0) === 0x89504e47) {
      const w = body.readUInt32BE(16);
      if (wanted.has(w) && !wanted.get(w)) wanted.set(w, body);
    }
    off += size;
  }
  for (const [size, png] of wanted) {
    if (!png) fail(`no ${size}x${size} PNG chunk in ${icnsPath}`);
    writeFileSync(`${iconOutBase}-${size}.png`, png);
    console.log(`icon ${size}x${size} -> ${iconOutBase}-${size}.png`);
  }
}

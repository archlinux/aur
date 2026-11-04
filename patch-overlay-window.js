#!/usr/bin/env node
// CatPaw 的 OverlayWindowManager 用一个「已显示但透明」的固定窗口做预览浮层：
//   new BrowserWindow({parent, frame:false, skipTaskbar:true, show:false, movable:false})
//   loadURL('about:blank'); makeOverlayInvisible(); showInactive();
// makeOverlayInvisible() 依赖 setOpacity(0) 隐藏窗口，而 Electron 的 setOpacity
// 只在 macOS/Windows 生效；Linux（尤其 Wayland）下窗口仍然被映射成实体窗口，
// 内容是 about:blank 且 movable:false —— 表现为启动后多出一个空白、无法拖动的窗口。
//
// 这里在构建期把 Linux 分支改为 hide()/show() 直达语义，替代 opacity 技巧。
// 锚点全部按内容匹配（bundle 文件名带 hash，每个版本都会变），并且任一锚点
// 找不到就退出非零 —— 让「上游重构」表现为构建失败，而不是悄悄产出未打补丁的包。
'use strict';

const fs = require('fs');
const path = require('path');

const [, , asarPath] = process.argv;
if (!asarPath) {
  console.error('usage: patch-overlay-window.js <path/to/app.asar>');
  process.exit(2);
}

const MARKER = 'catpaw-linux-overlay-hide';

function readHeader(file) {
  const fd = fs.openSync(file, 'r');
  const prefix = Buffer.alloc(16);
  fs.readSync(fd, prefix, 0, 16, 0);
  const sizeField = prefix.readUInt32LE(0);
  const headerSize = prefix.readUInt32LE(4);
  const jsonLength = prefix.readUInt32LE(12);
  if (sizeField !== 4) throw new Error('unexpected asar prefix');
  const json = Buffer.alloc(jsonLength);
  fs.readSync(fd, json, 0, jsonLength, 16);
  return {
    fd,
    header: JSON.parse(json.toString('utf8')),
    dataOffset: 8 + headerSize,
  };
}

// 按 header 顺序摊平所有条目：只有既非 link 也非 unpacked 的条目才有 payload。
function collectPacked(root) {
  const packed = [];
  (function walk(node, base) {
    for (const [name, entry] of Object.entries(node.files || {})) {
      const rel = base ? `${base}/${name}` : name;
      if (entry.files) {
        walk(entry, rel);
      } else if (!entry.link && !entry.unpacked) {
        packed.push({ rel, entry });
      }
    }
  })(root, '');
  return packed;
}

function readEntry(fd, dataOffset, entry) {
  const size = Number(entry.size);
  const buf = Buffer.alloc(size);
  let pos = Number(entry.offset);
  let left = size;
  while (left > 0) {
    const n = fs.readSync(fd, buf, size - left, left, dataOffset + pos);
    if (n === 0) throw new Error(`short read at ${pos} for ${entry}`);
    pos += n;
    left -= n;
  }
  return buf;
}

// 每条规则：给定锚点必须命中恰好一次；替换后必须包含 mustContain。
const RULES = [
  {
    // attachToWindow：构造后无条件 showInactive() 会把 about:blank 映射成可见窗口。
    // 仅 Linux 跳过，保留 macOS/Windows 的原有行为。
    old: "this.overlayWindow.loadURL(`about:blank`),this.makeOverlayInvisible(),this.overlayWindow.showInactive(),",
    new: "this.overlayWindow.loadURL(`about:blank`),this.makeOverlayInvisible(),process.platform!==`linux`&&this.overlayWindow.showInactive(),",
    mustContain: 'process.platform!==`linux`&&this.overlayWindow.showInactive()',
  },
  {
    // makeOverlayInvisible：Linux 下 setOpacity(0) 无效，改为真正 unmap
    old: 'this.overlayWindow.setOpacity(0)',
    new: 'process.platform===`linux`&&this.overlayWindow.hide(),this.overlayWindow.setOpacity(0)',
    mustContain: 'this.overlayWindow.hide()',
  },
  {
    // makeOverlayInteractive：Windows/macOS 靠 setOpacity(1) 恢复显示，
    // Linux 窗口已被 hide()，必须显式 show
    old: 'this.overlayWindow.setIgnoreMouseEvents(!1)',
    new: 'this.overlayWindow.setIgnoreMouseEvents(!1),process.platform===`linux`&&!this.overlayWindow.isVisible()&&this.overlayWindow.showInactive()',
    mustContain: '&&!this.overlayWindow.isVisible()&&this.overlayWindow.showInactive()',
  },
  {
    // doShowOverlay 的延迟显示回调只在 darwin 下 showInactive，Linux 需要同样处理
    old: 'process.platform===`darwin`&&!i.isVisible()&&i.showInactive()',
    new: '(process.platform===`darwin`||process.platform===`linux`)&&!i.isVisible()&&i.showInactive()',
    mustContain: '(process.platform===`darwin`||process.platform===`linux`)&&!i.isVisible()&&i.showInactive()',
  },
];

function main() {
  const { fd, header, dataOffset } = readHeader(asarPath);
  const packed = collectPacked(header);

  // 目标文件是 dist-electron 下的主进程 bundle，文件名带 hash 不可硬编码。
  let target = null;
  let targetBuf = null;
  for (const item of packed) {
    if (!item.rel.startsWith('dist-electron/') || !item.rel.endsWith('.js')) continue;
    const buf = readEntry(fd, dataOffset, item.entry);
    if (buf.includes('makeOverlayInvisible(t){')) {
      if (target) throw new Error(`multiple overlay bundles found: ${target.rel}, ${item.rel}`);
      target = item;
      targetBuf = buf;
    }
  }
  if (!target) throw new Error('overlay bundle (makeOverlayInvisible) not found in dist-electron/');

  let source = targetBuf.toString('utf8');
  for (const rule of RULES) {
    const count = source.split(rule.old).length - 1;
    if (count !== 1) {
      throw new Error(
        `anchor not found exactly once (${count}) in ${target.rel}: ${JSON.stringify(rule.old.slice(0, 60))}`
      );
    }
    source = source.replace(rule.old, rule.new);
    if (!source.includes(rule.mustContain)) {
      throw new Error(`replacement verification failed in ${target.rel}`);
    }
  }
  const patched = Buffer.from(source, 'utf8');
  console.log(`  patched ${target.rel} (${targetBuf.length} -> ${patched.length} bytes)`);

  // 重打包：payload 顺序沿用 header 顺序，偏移全部重算；integrity 一并清掉
  // （bundle 被改动后旧哈希必然失效，且这些 Windows 构建未启用签名校验）。
  let offset = 0;
  for (const item of packed) {
    delete item.entry.integrity;
    // 保留原始偏移：payload 仍按旧偏移读取，header 里写入新偏移
    item.srcOffset = Number(item.entry.offset);
    item.srcSize = Number(item.entry.size);
    item.entry.offset = String(offset);
    offset += item.rel === target.rel ? patched.length : item.srcSize;
    if (item.rel === target.rel) item.entry.size = patched.length;
  }

  const json = Buffer.from(JSON.stringify(header), 'utf8');
  const J = json.length;
  const padded = (4 + J + 3) & ~3;
  const padding = padded - (4 + J);
  const headerSize = padded + 4;

  const prefix = Buffer.alloc(16);
  prefix.writeUInt32LE(4, 0);
  prefix.writeUInt32LE(headerSize, 4);
  prefix.writeUInt32LE(headerSize - 4, 8);
  prefix.writeUInt32LE(J, 12);

  const tmp = `${asarPath}.${MARKER}.tmp`;
  const out = fs.openSync(tmp, 'w');
  fs.writeSync(out, prefix);
  fs.writeSync(out, json);
  if (padding > 0) fs.writeSync(out, Buffer.alloc(padding));

  const chunkSize = 4 * 1024 * 1024;
  const buf = Buffer.alloc(chunkSize);
  for (const item of packed) {
    if (item.rel === target.rel) {
      fs.writeSync(out, patched);
      continue;
    }
    let pos = item.srcOffset;
    let left = item.srcSize;
    while (left > 0) {
      const n = fs.readSync(fd, buf, 0, Math.min(chunkSize, left), dataOffset + pos);
      fs.writeSync(out, buf, 0, n);
      pos += n;
      left -= n;
    }
  }
  fs.fsyncSync(out);
  fs.closeSync(out);
  fs.closeSync(fd);
  fs.chmodSync(tmp, 0o644);
  fs.renameSync(tmp, asarPath);
  console.log(`  asar repacked: ${packed.length} packed entries, payload ${offset} bytes`);
}

try {
  main();
} catch (err) {
  console.error(`error: ${MARKER}: ${err.message}`);
  process.exit(1);
}

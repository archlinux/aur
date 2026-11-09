#!/usr/bin/env node
// Pin the MiniMax Code desktop bundle to one region and isolate its profile.
//
// The upstream Windows package ships a mainland-China build (REGION:"cn",
// agent.minimax.cn). The renderer chunks inline every NEXT_PUBLIC_* URL and
// carry a duplicated region module (webpack module 58291) exporting `a1`
// (isOverseas, false). The intl build flips that flag and rewrites the inlined
// endpoints; the cn build keeps the upstream values untouched. Both builds
// rewrite package.json's name so Electron derives a distinct userData dir.
//
// The archive is rewritten in place (packed entries only, offsets recomputed)
// because `asar extract` fails on this payload: its header marks Windows/macOS
// prebuilds as unpacked, but the installer ships only the win32-x64 subset.
//
// usage: patch-region.js <app.asar> <intl|cn>
'use strict';

const fs = require('fs');
const path = require('path');

const [, , asarPath, mode] = process.argv;
if (!asarPath || !mode) {
  console.error('usage: patch-region.js <app.asar> <intl|cn>');
  process.exit(2);
}
if (mode !== 'intl' && mode !== 'cn') {
  console.error(`unknown mode: ${mode}`);
  process.exit(2);
}

const INTL_REPLACEMENTS = [
  ['https://agent.minimax.cn', 'https://agent.minimax.io'],
  ['wss://agent.minimax.cn', 'wss://agent.minimax.io'],
  ['https://chat.minimaxi.com', 'https://chat.minimax.io'],
  ['https://account.minimax.cn', 'https://account.minimax.io'],
  ['https://platform.minimaxi.com', 'https://platform.minimax.io'],
  ['https://www.minimaxi.com', 'https://www.minimax.io'],
  ['https://code.minimax.cn', 'https://code.minimax.io'],
  ['https://share.mcode.cn', 'https://share.mcode.io'],
  ['REGION:"cn"', 'REGION:"overseas"'],
  ['NEXT_PUBLIC_LOCALE="zh"', 'NEXT_PUBLIC_LOCALE="en"'],
];

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
  return { fd, header: JSON.parse(json.toString('utf8')), dataOffset: 8 + headerSize };
}

// Flatten header entries that own payload bytes; link/unpacked entries live
// outside the archive and are left untouched.
function collectPacked(root) {
  const packed = [];
  (function walk(node, base) {
    for (const [name, entry] of Object.entries(node.files || {})) {
      const rel = base ? `${base}/${name}` : name;
      if (entry.files) walk(entry, rel);
      else if (!entry.link && !entry.unpacked) packed.push({ rel, entry });
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
    if (n === 0) throw new Error(`short read at ${pos} (${size} bytes expected)`);
    pos += n;
    left -= n;
  }
  return buf;
}

let patched = 0;
let regionFlagFlipped = 0;

function patchIntl(rel, source) {
  let out = source;
  for (const [from, to] of INTL_REPLACEMENTS) {
    if (out.includes(from)) out = out.split(from).join(to);
  }
  // Flip the duplicated region module's a1/isOverseas export. Minified
  // variable names differ per chunk, so resolve the export name first.
  if (out.includes('58291:function')) {
    const start = out.indexOf('58291:function');
    const match = out.slice(start, start + 1200).match(/a1:function\(\)\{return (\w+)\}/);
    if (!match) throw new Error(`a1 export not found in ${rel}`);
    const name = match[1];
    const idx = out.indexOf(`${name}=!1`, start);
    if (idx < 0) throw new Error(`a1 assignment not found in ${rel}`);
    out = out.slice(0, idx) + `${name}=!0` + out.slice(idx + name.length + 3);
    regionFlagFlipped++;
  }
  if (out !== source) patched++;
  return out;
}

function patchPackageName(rel, source) {
  const pkg = JSON.parse(source);
  pkg.name = mode === 'intl' ? 'minimax-code-intl' : 'minimax-code-cn';
  patched++;
  return `${JSON.stringify(pkg, null, 2)}\n`;
}

function main() {
  const { fd, header, dataOffset } = readHeader(asarPath);
  const packed = collectPacked(header);

  for (const item of packed) {
    const isJs = /\.(js|mjs|cjs)$/.test(item.rel);
    const isEnv = item.rel === '.env.local';
    const isPkg = item.rel === 'package.json';
    if (!isJs && !isEnv && !isPkg) continue;

    const buf = readEntry(fd, dataOffset, item.entry);
    const source = buf.toString('utf8');
    let out = source;
    if (isPkg) out = patchPackageName(item.rel, source);
    else if (mode === 'intl' && (isEnv || isJs)) out = patchIntl(item.rel, source);
    if (out !== source) {
      item.patched = Buffer.from(out, 'utf8');
    }
  }

  const pkgItem = packed.find((i) => i.rel === 'package.json');
  if (!pkgItem || !pkgItem.patched) {
    throw new Error('package.json was not rewritten (asar layout changed)');
  }

  if (mode === 'intl') {
    if (regionFlagFlipped === 0) throw new Error('no region module (58291) was flipped');
    const envItem = packed.find((i) => i.rel === '.env.local');
    if (!envItem || !envItem.patched) throw new Error('.env.local was not rewritten');
    if (!envItem.patched.toString('utf8').includes('https://agent.minimax.io')) {
      throw new Error('.env.local still points at the cn domain');
    }
  }

  // Recompute every packed offset in header order, dropping stale integrity
  // hashes for the entries whose bytes changed.
  let offset = 0;
  for (const item of packed) {
    item.srcOffset = Number(item.entry.offset);
    item.srcSize = Number(item.entry.size);
    if (item.patched) {
      delete item.entry.integrity;
      item.entry.offset = String(offset);
      item.entry.size = item.patched.length;
      offset += item.patched.length;
    } else {
      item.entry.offset = String(offset);
      offset += item.srcSize;
    }
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

  const tmp = `${asarPath}.patch-region.tmp`;
  const out = fs.openSync(tmp, 'w');
  fs.writeSync(out, prefix);
  fs.writeSync(out, json);
  if (padding > 0) fs.writeSync(out, Buffer.alloc(padding));

  const chunkSize = 4 * 1024 * 1024;
  const buf = Buffer.alloc(chunkSize);
  for (const item of packed) {
    if (item.patched) {
      fs.writeSync(out, item.patched);
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

  console.log(`patched ${patched} packed entry(s) for ${mode} (region modules flipped: ${regionFlagFlipped})`);
}

try {
  main();
} catch (err) {
  console.error(`error: patch-region: ${err.message}`);
  process.exit(1);
}

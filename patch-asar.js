#!/usr/bin/env node
// Patch the packed JavaScript inside app.asar in place.
//
// The archive is rewritten entry by entry (packed entries only, offsets
// recomputed). This keeps app.asar.unpacked untouched; update it separately
// with sync-unpacked.js.
//
// usage: patch-asar.js <app.asar>
'use strict';

const fs = require('fs');

const [, , asarPath] = process.argv;
if (!asarPath) {
  console.error('usage: patch-asar.js <app.asar>');
  process.exit(2);
}

const RESOURCE_EXPR =
  '(process.env.MINIMAX_CODE_RESOURCES_PATH ?? process.resourcesPath)';

function patchMainJs(rel, source) {
  let out = source;

  if (rel.startsWith('dist/main/') && out.includes('process.resourcesPath')) {
    out = out.split('process.resourcesPath').join(RESOURCE_EXPR);
  }

  if (rel === 'dist/main/modules/updater/index.js' && !out.includes('minimax-code-desktop')) {
    const marker = 'function initUpdater() {';
    if (!out.includes(marker)) {
      throw new Error('updater entry changed; cannot insert disable switch');
    }
    out = out.replace(
      marker,
      `${marker}\n    if (process.env.MINIMAX_CODE_DISABLE_UPDATER === '1') {\n        logger.info('[Updater] disabled by minimax-code-desktop');\n        return;\n    }`,
    );
  }

  if (rel === 'dist/main/index.js' && !out.includes('get: () => true')) {
    const marker = 'const electron_1 = require("electron");';
    if (!out.includes(marker)) {
      throw new Error('main entry changed; cannot patch app.isPackaged');
    }
    out = out.replace(
      marker,
      `${marker}\ntry {\n    Object.defineProperty(electron_1.app, "isPackaged", { configurable: true, get: () => true });\n}\ncatch {}\n`,
    );
  }

  if (rel === 'dist/main/modules/deeplink/index.js' && !out.includes("process.platform !== 'linux'")) {
    const marker = 'else if (process.defaultApp) {';
    if (!out.includes(marker)) {
      throw new Error('deeplink entry changed; cannot patch defaultApp branch');
    }
    out = out.replace(marker, "else if (process.defaultApp && process.platform !== 'linux') {");
  }

  return out;
}

function main() {
  const fd = fs.openSync(asarPath, 'r');
  const prefix = Buffer.alloc(16);
  fs.readSync(fd, prefix, 0, 16, 0);
  const headerSize = prefix.readUInt32LE(4);
  const jsonLength = prefix.readUInt32LE(12);
  const json = Buffer.alloc(jsonLength);
  fs.readSync(fd, json, 0, jsonLength, 16);
  const header = JSON.parse(json.toString('utf8'));
  const dataOffset = 8 + headerSize;

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
  })(header, '');

  let patched = 0;
  for (const item of packed) {
    if (!/^dist\/main\/.*\.js$/.test(item.rel)) continue;
    const size = Number(item.entry.size);
    const buf = Buffer.alloc(size);
    fs.readSync(fd, buf, 0, size, dataOffset + Number(item.entry.offset));
    const source = buf.toString('utf8');
    const out = patchMainJs(item.rel, source);
    if (out !== source) {
      item.patched = Buffer.from(out, 'utf8');
      patched++;
    }
  }

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

  const outJson = Buffer.from(JSON.stringify(header), 'utf8');
  const J = outJson.length;
  const padded = (4 + J + 3) & ~3;
  const padding = padded - (4 + J);
  const newHeaderSize = padded + 4;

  const outPrefix = Buffer.alloc(16);
  outPrefix.writeUInt32LE(4, 0);
  outPrefix.writeUInt32LE(newHeaderSize, 4);
  outPrefix.writeUInt32LE(newHeaderSize - 4, 8);
  outPrefix.writeUInt32LE(J, 12);

  const tmp = `${asarPath}.patch.tmp`;
  const out = fs.openSync(tmp, 'w');
  fs.writeSync(out, outPrefix);
  fs.writeSync(out, outJson);
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

  console.log(`patched ${patched} main-process file(s)`);
}

try {
  main();
} catch (err) {
  console.error(`error: patch-asar: ${err.message}`);
  process.exit(1);
}

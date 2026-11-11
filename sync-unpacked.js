#!/usr/bin/env node
// Reconcile the app.asar header's unpacked entries with the files that
// actually exist in app.asar.unpacked. Electron resolves unpacked paths from
// the header only, so replaced or removed platform modules must be registered
// here or they will not load.
//
// usage: sync-unpacked.js <app.asar> <app.asar.unpacked>
'use strict';

const fs = require('fs');
const path = require('path');

const [, , asarPath, unpackedDir] = process.argv;
if (!asarPath || !unpackedDir) {
  console.error('usage: sync-unpacked.js <asar> <unpacked-dir>');
  process.exit(2);
}

const fd = fs.openSync(asarPath, 'r');
const prefix = Buffer.alloc(16);
fs.readSync(fd, prefix, 0, 16, 0);
const headerSize = prefix.readUInt32LE(4);
const jsonLength = prefix.readUInt32LE(12);
const json = Buffer.alloc(jsonLength);
fs.readSync(fd, json, 0, jsonLength, 16);
const header = JSON.parse(json.toString('utf8'));
const dataOffset = 8 + headerSize;
const fileSize = fs.fstatSync(fd).size;

const diskFiles = new Map();
(function walk(dir, base) {
  for (const name of fs.readdirSync(dir)) {
    const abs = path.join(dir, name);
    const rel = base ? `${base}/${name}` : name;
    const st = fs.lstatSync(abs);
    if (st.isDirectory()) {
      walk(abs, rel);
    } else if (st.isFile()) {
      diskFiles.set(rel, st.size);
    } else if (st.isSymbolicLink()) {
      throw new Error(`symlink inside app.asar.unpacked is not supported: ${rel}`);
    }
  }
})(unpackedDir, '');

function ensureDir(root, parts) {
  let node = root;
  for (const part of parts) {
    if (!node.files) node.files = {};
    if (!node.files[part]) node.files[part] = { files: {} };
    node = node.files[part];
  }
  return node;
}

let added = 0;
let updated = 0;
let removed = 0;
const seen = new Set();

(function walkHeader(node, base) {
  for (const name of Object.keys(node.files || {})) {
    const rel = base ? `${base}/${name}` : name;
    const entry = node.files[name];
    if (entry.files) {
      walkHeader(entry, rel);
      continue;
    }
    if (!entry.unpacked) continue;
    seen.add(rel);
    const size = diskFiles.get(rel);
    if (size === undefined) {
      delete node.files[name];
      removed++;
      continue;
    }
    delete entry.integrity;
    if (entry.size !== size) {
      entry.size = size;
      updated++;
    }
  }
})(header, '');

for (const [rel, size] of diskFiles) {
  if (seen.has(rel)) continue;
  const parts = rel.split('/');
  const leaf = parts.pop();
  ensureDir(header, parts).files[leaf] = { size, unpacked: true };
  added++;
}

const outJson = Buffer.from(JSON.stringify(header), 'utf8');
const J = outJson.length;
const padded = (4 + J + 3) & ~3;
const padding = padded - (4 + J);
const newHeaderSize = padded + 4;
const newDataOffset = 8 + newHeaderSize;

const outPrefix = Buffer.alloc(16);
outPrefix.writeUInt32LE(4, 0);
outPrefix.writeUInt32LE(newHeaderSize, 4);
outPrefix.writeUInt32LE(newHeaderSize - 4, 8);
outPrefix.writeUInt32LE(J, 12);

const tmp = `${asarPath}.unpacked.tmp`;
const out = fs.openSync(tmp, 'w');
fs.writeSync(out, outPrefix);
fs.writeSync(out, outJson);
if (padding > 0) fs.writeSync(out, Buffer.alloc(padding));

const chunkSize = 4 * 1024 * 1024;
const buf = Buffer.alloc(chunkSize);
let pos = dataOffset;
while (pos < fileSize) {
  const n = fs.readSync(fd, buf, 0, Math.min(chunkSize, fileSize - pos), pos);
  fs.writeSync(out, buf, 0, n);
  pos += n;
}
fs.fsyncSync(out);
fs.closeSync(out);
fs.closeSync(fd);
fs.chmodSync(tmp, 0o644);
fs.renameSync(tmp, asarPath);

console.log(
  `unpacked entries synced: +${added} added, ${updated} resized, ${removed} removed ` +
    `(payload offset ${dataOffset} -> ${newDataOffset})`,
);

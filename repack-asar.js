#!/usr/bin/env node
// Rewrite an Electron asar header so that the on-disk app.asar.unpacked
// directory is the source of truth for unpacked entries. Electron resolves
// paths that are absent from the header as "not found" - it does not fall
// back to the real filesystem - so Linux replacement packages (sharp, koffi,
// @napi-rs/canvas, @wecom/cli, agent-browser) must be registered here.
//
// The payload is copied verbatim; asar file offsets are relative to the
// start of the data section, so only the header prefix changes.
'use strict';

const fs = require('fs');
const path = require('path');

const [, , asarPath, unpackedDir] = process.argv;
if (!asarPath || !unpackedDir) {
  console.error('usage: repack-asar.js <app.asar> <app.asar.unpacked>');
  process.exit(2);
}

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
  const dataOffset = 8 + headerSize;
  fs.closeSync(fd);
  return { header: JSON.parse(json.toString('utf8')), jsonLength, headerSize, dataOffset };
}

function walkDisk(dir, base, out) {
  for (const name of fs.readdirSync(dir)) {
    const abs = path.join(dir, name);
    const rel = base ? `${base}/${name}` : name;
    const st = fs.lstatSync(abs);
    if (st.isDirectory()) {
      walkDisk(abs, rel, out);
    } else if (st.isFile()) {
      out.set(rel, st.size);
    } else if (st.isSymbolicLink()) {
      throw new Error(`symlink inside app.asar.unpacked is not supported: ${rel}`);
    }
  }
}

function walkHeader(node, base, visit) {
  const files = node.files || {};
  for (const name of Object.keys(files)) {
    const rel = base ? `${base}/${name}` : name;
    const entry = files[name];
    if (entry.files) {
      walkHeader(entry, rel, visit);
    } else {
      visit(rel, entry, files, name);
    }
  }
}

function ensureDir(root, parts) {
  let node = root;
  for (const part of parts) {
    if (!node.files) node.files = {};
    if (!node.files[part]) node.files[part] = { files: {} };
    node = node.files[part];
  }
  return node;
}

const { header, jsonLength, headerSize, dataOffset } = readHeader(asarPath);
const diskFiles = new Map();
walkDisk(unpackedDir, '', diskFiles);

let added = 0;
let updated = 0;
let removed = 0;
const seen = new Set();

walkHeader(header, '', (rel, entry, siblings, name) => {
  if (!entry.unpacked) return;
  seen.add(rel);
  const size = diskFiles.get(rel);
  if (size === undefined) {
    delete siblings[name];
    removed++;
    return;
  }
  // The on-disk unpacked file is authoritative; stale integrity hashes would
  // fail embedded-asar integrity checks after replacement.
  delete entry.integrity;
  if (entry.size !== size) {
    entry.size = size;
    updated++;
  }
});

for (const [rel, size] of diskFiles) {
  if (seen.has(rel)) continue;
  const parts = rel.split('/');
  const leaf = parts.pop();
  const parent = ensureDir(header, parts);
  parent.files[leaf] = { size, unpacked: true };
  added++;
}

const json = Buffer.from(JSON.stringify(header), 'utf8');
const J = json.length;
const padded = (4 + J + 3) & ~3;
const newHeaderSize = padded + 4;
const padding = padded - (4 + J);
const newDataOffset = 8 + newHeaderSize;

const prefix = Buffer.alloc(16);
prefix.writeUInt32LE(4, 0);
prefix.writeUInt32LE(newHeaderSize, 4);
prefix.writeUInt32LE(newHeaderSize - 4, 8);
prefix.writeUInt32LE(J, 12);

const tmp = `${asarPath}.repack`;
const input = fs.openSync(asarPath, 'r');
const output = fs.openSync(tmp, 'w');

fs.writeSync(output, prefix);
fs.writeSync(output, json);
if (padding > 0) fs.writeSync(output, Buffer.alloc(padding));

const chunkSize = 4 * 1024 * 1024;
const buf = Buffer.alloc(chunkSize);
let pos = dataOffset;
const end = fs.fstatSync(input).size;
while (pos < end) {
  const n = fs.readSync(input, buf, 0, Math.min(chunkSize, end - pos), pos);
  fs.writeSync(output, buf, 0, n);
  pos += n;
}
fs.fsyncSync(output);
fs.closeSync(output);
fs.closeSync(input);
fs.renameSync(tmp, asarPath);
// mkstemp-style 'w' honours the build umask; force world-readable so the app
// still starts when the package is built with a restrictive umask.
fs.chmodSync(asarPath, 0o644);

console.log(
  `asar header updated: +${added} added, ${updated} resized, ${removed} removed ` +
    `(payload offset ${dataOffset} -> ${newDataOffset})`
);

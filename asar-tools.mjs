#!/usr/bin/env node
// SPDX-FileCopyrightText: 2026 Arch Linux Contributors
// SPDX-License-Identifier: 0BSD

import {
  chmodSync,
  closeSync,
  copyFileSync,
  existsSync,
  mkdirSync,
  openSync,
  readFileSync,
  readSync,
  readdirSync,
  rmSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { createHash } from "node:crypto";
import { dirname, join, relative, sep } from "node:path";

const BLOCK_SIZE = 4 * 1024 * 1024;

function fail(message) {
  console.error(`asar-tools: ${message}`);
  process.exit(1);
}

function toAsarPath(path) {
  return path.split(sep).join("/");
}

function readHeader(asarPath) {
  const fd = openSync(asarPath, "r");
  const sizes = Buffer.alloc(16);
  readSync(fd, sizes, 0, 16, 0);
  const pickleSize = sizes.readUInt32LE(4);
  const headerSize = sizes.readUInt32LE(12);
  const header = Buffer.alloc(headerSize);
  readSync(fd, header, 0, headerSize, 16);
  closeSync(fd);
  return {
    dataOffset: 8 + pickleSize,
    files: JSON.parse(header.toString("utf8")).files,
  };
}

function readAsarFile(asarPath, dataOffset, entry) {
  const buffer = Buffer.alloc(entry.size);
  const fd = openSync(asarPath, "r");
  readSync(fd, buffer, 0, entry.size, dataOffset + Number(entry.offset));
  closeSync(fd);
  return buffer;
}

function ensureParent(path) {
  mkdirSync(dirname(path), { recursive: true });
}

function copyWithMode(source, target) {
  ensureParent(target);
  copyFileSync(source, target);
  chmodSync(target, statSync(source).mode);
}

function extractTree({ asarPath, dataOffset, files, outDir, relPath, unpackedDir }) {
  for (const [name, entry] of Object.entries(files)) {
    const childRelPath = relPath ? `${relPath}/${name}` : name;
    const target = join(outDir, ...childRelPath.split("/"));
    if (entry.files) {
      mkdirSync(target, { recursive: true });
      extractTree({
        asarPath,
        dataOffset,
        files: entry.files,
        outDir,
        relPath: childRelPath,
        unpackedDir,
      });
      continue;
    }

    if (entry.link) {
      fail(`link entries are not supported: ${childRelPath}`);
    }

    if (entry.unpacked) {
      const source = join(unpackedDir, ...childRelPath.split("/"));
      if (!existsSync(source)) {
        fail(`missing unpacked file: ${source}`);
      }
      copyWithMode(source, target);
    } else {
      ensureParent(target);
      writeFileSync(target, readAsarFile(asarPath, dataOffset, entry));
      if (entry.executable) {
        chmodSync(target, 0o755);
      }
    }
  }
}

function sha256(buffer) {
  return createHash("sha256").update(buffer).digest("hex");
}

function integrityFor(buffer) {
  const blocks = [];
  if (buffer.length === 0) {
    blocks.push(sha256(Buffer.alloc(0)));
  } else {
    for (let offset = 0; offset < buffer.length; offset += BLOCK_SIZE) {
      blocks.push(sha256(buffer.subarray(offset, offset + BLOCK_SIZE)));
    }
  }
  return {
    algorithm: "SHA256",
    hash: sha256(buffer),
    blockSize: BLOCK_SIZE,
    blocks,
  };
}

function shouldUnpack(path) {
  return path.endsWith(".node") || path.endsWith(".so");
}

function buildTree({ rootDir, unpackedDir, dir, dataParts, offsetRef }) {
  const files = {};
  const entries = readdirSync(dir, { withFileTypes: true }).sort((a, b) =>
    a.name.localeCompare(b.name),
  );

  for (const entry of entries) {
    const fullPath = join(dir, entry.name);
    const relPath = toAsarPath(relative(rootDir, fullPath));

    if (entry.isDirectory()) {
      files[entry.name] = {
        files: buildTree({ rootDir, unpackedDir, dir: fullPath, dataParts, offsetRef }),
      };
      continue;
    }

    if (!entry.isFile()) {
      fail(`unsupported filesystem entry: ${fullPath}`);
    }

    const buffer = readFileSync(fullPath);
    const mode = statSync(fullPath).mode;
    const metadata = {
      size: buffer.length,
      integrity: integrityFor(buffer),
    };

    if ((mode & 0o111) !== 0) {
      metadata.executable = true;
    }

    if (shouldUnpack(relPath)) {
      metadata.unpacked = true;
      const unpackedTarget = join(unpackedDir, ...relPath.split("/"));
      copyWithMode(fullPath, unpackedTarget);
    } else {
      metadata.offset = String(offsetRef.value);
      dataParts.push(buffer);
      offsetRef.value += buffer.length;
    }

    files[entry.name] = metadata;
  }

  return files;
}

function headerPrefix(jsonLength) {
  const pad = (4 - (jsonLength % 4)) % 4;
  const payloadSize = 4 + jsonLength + pad;
  const pickleSize = 4 + payloadSize;
  const prefix = Buffer.alloc(16);
  prefix.writeUInt32LE(4, 0);
  prefix.writeUInt32LE(pickleSize, 4);
  prefix.writeUInt32LE(payloadSize, 8);
  prefix.writeUInt32LE(jsonLength, 12);
  return { prefix, pad };
}

function extract(asarPath, outDir, unpackedDir = `${asarPath}.unpacked`) {
  const { dataOffset, files } = readHeader(asarPath);
  rmSync(outDir, { force: true, recursive: true });
  mkdirSync(outDir, { recursive: true });
  extractTree({ asarPath, dataOffset, files, outDir, relPath: "", unpackedDir });
}

function pack(inDir, asarPath, unpackedDir = `${asarPath}.unpacked`) {
  rmSync(asarPath, { force: true });
  rmSync(unpackedDir, { force: true, recursive: true });
  mkdirSync(unpackedDir, { recursive: true });

  const dataParts = [];
  const offsetRef = { value: 0 };
  const root = {
    files: buildTree({ rootDir: inDir, unpackedDir, dir: inDir, dataParts, offsetRef }),
  };
  const header = Buffer.from(JSON.stringify(root), "utf8");
  const { prefix, pad } = headerPrefix(header.length);
  writeFileSync(asarPath, Buffer.concat([prefix, header, Buffer.alloc(pad), ...dataParts]));
}

const [command, first, second, third] = process.argv.slice(2);

switch (command) {
  case "extract":
    if (!first || !second) fail("usage: asar-tools.mjs extract <app.asar> <out-dir> [app.asar.unpacked]");
    extract(first, second, third);
    break;
  case "pack":
    if (!first || !second) fail("usage: asar-tools.mjs pack <in-dir> <app.asar> [app.asar.unpacked]");
    pack(first, second, third);
    break;
  default:
    fail("usage: asar-tools.mjs <extract|pack> ...");
}

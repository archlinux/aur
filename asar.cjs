#!/usr/bin/env node
// Minimal ASAR tooling for the Linux port. No npm dependencies.
//
//   asar.cjs unpack <app.asar> <out-dir>   expand an archive (sidecars included)
//   asar.cjs shadow <app-dir>  <app.asar>  write an archive whose every entry
//                                          points at the unpacked sidecar tree
//
// The shadow archive lets us ship a plain directory tree: Electron reads the
// index but loads each file from <app.asar>.unpacked, so patches and native
// module swaps never need to rewrite an ASAR payload.
'use strict';

const fs = require('node:fs');
const path = require('node:path');

// Sidecars that belong to a platform other than the one this archive was
// built for are legitimately absent; port.sh installs the Linux equivalents
// from the donor package. Anything that is not platform-tagged must exist.
const FOREIGN =
  /(?:^|[^a-z0-9])(?:darwin|win32|linux|freebsd|openbsd|android|musl|mac|win)(?:[^a-z0-9]|$)/i;

function readArchive(archivePath) {
  const fd = fs.openSync(archivePath, 'r');
  const head = Buffer.alloc(8);
  fs.readSync(fd, head, 0, 8, 0);
  const headerSize = head.readUInt32LE(4);
  const header = Buffer.alloc(headerSize);
  fs.readSync(fd, header, 0, headerSize, 8);
  const jsonLength = header.readUInt32LE(4);
  const tree = JSON.parse(header.subarray(8, 8 + jsonLength).toString('utf8'));
  return { fd, tree, dataStart: 8 + headerSize };
}

function safeJoin(root, relative) {
  const parts = relative.split('/');
  if (parts.some((part) => !part || part === '.' || part === '..' || part.includes('\\'))) {
    throw new Error(`unsafe ASAR path: ${relative}`);
  }
  return path.join(root, ...parts);
}

function unpack(archivePath, outDir) {
  const sidecar = archivePath + '.unpacked';
  const { fd, tree, dataStart } = readArchive(archivePath);
  fs.rmSync(outDir, { recursive: true, force: true });
  fs.mkdirSync(outDir, { recursive: true });

  let packed = 0;
  let copied = 0;
  let skipped = 0;
  let links = 0;

  const walk = (node, prefix) => {
    for (const [name, entry] of Object.entries(node.files || {})) {
      const relative = prefix ? `${prefix}/${name}` : name;
      const target = safeJoin(outDir, relative);
      if (entry.files) {
        fs.mkdirSync(target, { recursive: true });
        walk(entry, relative);
      } else if (entry.link) {
        fs.mkdirSync(path.dirname(target), { recursive: true });
        fs.symlinkSync(entry.link, target);
        links += 1;
      } else if (entry.unpacked) {
        const source = path.join(sidecar, ...relative.split('/'));
        if (!fs.existsSync(source)) {
          if (!FOREIGN.test(relative)) {
            throw new Error(`missing sidecar file: ${relative}`);
          }
          skipped += 1;
          continue;
        }
        fs.mkdirSync(path.dirname(target), { recursive: true });
        fs.copyFileSync(source, target);
        fs.chmodSync(target, fs.statSync(source).mode & 0o777);
        copied += 1;
      } else {
        fs.mkdirSync(path.dirname(target), { recursive: true });
        const buffer = Buffer.alloc(entry.size);
        fs.readSync(fd, buffer, 0, entry.size, dataStart + Number(entry.offset));
        fs.writeFileSync(target, buffer);
        if (entry.executable) fs.chmodSync(target, 0o755);
        packed += 1;
      }
    }
  };

  walk(tree, '');
  fs.closeSync(fd);
  console.log(`unpack: ${packed} packed, ${copied} sidecar, ${links} links, ${skipped} foreign-platform sidecars skipped`);
}

function shadow(sourceDir, archivePath) {
  const u32 = (value) => {
    const buffer = Buffer.alloc(4);
    buffer.writeUInt32LE(value);
    return buffer;
  };

  // Collect first: the output archive may live inside the tree it indexes.
  const build = (dir) => {
    const files = {};
    for (const name of fs.readdirSync(dir).sort()) {
      const full = path.join(dir, name);
      const stat = fs.lstatSync(full);
      if (stat.isDirectory()) {
        files[name] = { files: build(full).files };
      } else if (stat.isSymbolicLink()) {
        files[name] = { link: fs.readlinkSync(full) };
      } else if (stat.isFile()) {
        const entry = { size: stat.size, unpacked: true };
        if (stat.mode & 0o111) entry.executable = true;
        files[name] = entry;
      }
    }
    return { files };
  };

  const tree = build(sourceDir);
  const json = Buffer.from(JSON.stringify(tree));
  // ASAR header = Pickle( Pickle( string ) ):
  //   u32(4) u32(blockSize) u32(stringSize) u32(jsonSize) json pad
  let payload = Buffer.concat([u32(json.length), json]);
  payload = Buffer.concat([payload, Buffer.alloc((4 - (payload.length % 4)) % 4)]);
  const block = Buffer.concat([u32(payload.length), payload]);
  fs.mkdirSync(path.dirname(archivePath), { recursive: true });
  fs.writeFileSync(archivePath, Buffer.concat([u32(4), u32(block.length), block]));
  console.log(`shadow: wrote ${archivePath} (${Object.keys(tree.files).length} top-level entries)`);
}

const [, , command, ...args] = process.argv;
if (command === 'unpack' && args.length === 2) {
  unpack(args[0], args[1]);
} else if (command === 'shadow' && args.length === 2) {
  shadow(args[0], args[1]);
} else {
  console.error('usage: asar.cjs unpack <app.asar> <out-dir> | asar.cjs shadow <app-dir> <app.asar>');
  process.exit(2);
}

#!/usr/bin/env bun
/* eslint-disable no-console */
import fs from 'fs';

console.info('Checking updates.');

const meta = 'https://www.blackmagicdesign.com/api/support/us/downloads.json';
const { downloads } = await fetch(meta).then(res => res.json());

const pkgbuildLines = fs.readFileSync('PKGBUILD', 'utf8').split('\n');

function setVar(name: string, value: string) {
  for (let i = 0; i < pkgbuildLines.length; i++) {
    if (pkgbuildLines[i].startsWith(name + '=')) {
      pkgbuildLines[i] = `${name}=${value}`;
      return;
    }
  }
  throw new Error(`Cannot find var ${name} in PKGBUILD`);
}

const pkgver = pkgbuildLines
  .find(line => line.startsWith('pkgver='))
  ?.split('=')[1]
  .trim();

const latest = downloads.find((d: any) => d.releaseNotesTitle.startsWith('Fusion Studio'));

const r = latest.urls.Linux[0];
const newVersion = `${r.major}.${r.minor}.${r.releaseNum}`.replace(/\.0\b/g, '');
if (newVersion !== pkgver) {
  setVar('_downloadid', r.downloadId);
  setVar('pkgver', newVersion);
  setVar('pkgrel', '1');

  // todo, download and update the sha256sum
  // and run `makepkg --printsrcinfo > .SRCINFO`

  fs.writeFileSync('PKGBUILD', pkgbuildLines.join('\n'));
  console.info(`Updated PKGBUILD to ${newVersion}`);
} else {
  console.info('Already up to date');
}

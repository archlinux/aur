#!/usr/bin/env node
const { argv, exit } = require('node:process');
const patchAsar = require('../source/index.js');
const args = process.argv.slice(2);

if (args.length < 2) {
  console.info(`Usage: ${argv[1]} IN.asar PATCHDIR [OUT.asar]`)
  exit(1);
} else if (args.length < 3) {
  patchAsar(...args);
} else {
  patchAsar(args[0], args[1], { outputFile: args[2] });
}

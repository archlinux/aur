#!/usr/bin/env node

const path = require('node:path');
const { argv, cwd, env, exit } = require('node:process');

const args = argv.slice(2);

if (args.length < 2) {
  console.info(
    `Usage: ${path.basename(argv[1])} IN.asar PATCHDIR [OUT.asar]`);
  exit(1);
}

// Add patch directory’s parent to NODE_PATH to make it require-able
const patchDir = args[1];
const moduleSearchDir = path.dirname(path.resolve(patchDir));
env.NODE_PATH = moduleSearchDir;
require('module').Module._initPaths();

const patchAsar = require('../source/index.js');

if (args.length < 3) {
  patchAsar(...args, { workingDirectory: cwd() });
} else {
  patchAsar(args[0], args[1], {
    outputFile: args[2],
    workingDirectory: cwd(),
  });
}

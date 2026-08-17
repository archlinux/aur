#!/usr/bin/env node

const fs = require('fs');

if (process.argv.length !== 3) {
  console.error(`Usage: ${process.argv[1]} /path/to/linux-x64.node`);
  process.exit(2);
}

const file = process.argv[2];
const context = Buffer.from('4881ec58110000e8a26fffff4885c07433', 'hex');
const call = Buffer.from('e8a26fffff', 'hex');
const noDisplay = Buffer.from('31c0909090', 'hex');
const data = fs.readFileSync(file);
const contextOffset = data.indexOf(context);

if (contextOffset < 0 || data.indexOf(context, contextOffset + 1) >= 0) {
  throw new Error('Expected unique uTools 7.8.0 GetNativeWorkWindow context was not found');
}

const callOffset = contextOffset + 7;
if (!data.subarray(callOffset, callOffset + call.length).equals(call)) {
  throw new Error('XOpenDisplay call bytes differ from the verified uTools 7.8.0 build');
}

noDisplay.copy(data, callOffset);
fs.writeFileSync(file, data);
console.log(`Patched GetNativeWorkWindow at file offset 0x${callOffset.toString(16)}`);


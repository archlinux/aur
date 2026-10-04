#!/usr/bin/env node
'use strict';
const { call } = require('./client.cjs');
const { approve } = require('./approval.cjs');
const { stdio } = require('./mcp.cjs');
const { fail } = require('./private.cjs');
async function stdin() {
  let buffer = Buffer.alloc(0);
  for await (const chunk of process.stdin) {
    buffer = Buffer.concat([buffer, chunk]);
    if (buffer.length > 30000) fail('TOO_LARGE');
  }
  try { return JSON.parse(buffer.toString('utf8')); } catch { fail('INVALID_JSON'); }
}
async function main(args) {
  if (args.length > 1) fail('INVALID_ARGUMENTS');
  const command = args[0] ?? 'help';
  if (command === 'help' || command === '--help') {
    process.stdout.write('Usage: whatsapp-controls help|list|send|status|version|diagnostics|approve|mcp\nlist/send/approve read one JSON object from stdin. list requires {} for defaults.\napprove requires an interactive /dev/tty and the exact send request.\nversion reads only the public web build; list/send still require a pin.\ndiagnostics returns aggregate model counts only.\nmcp speaks newline-delimited JSON-RPC on stdio; no approval tool.\n'); return;
  }
  if (command === 'mcp') return stdio();
  let result;
  if (command === 'status') result = await call('status', {});
  else if (command === 'version') result = await call('runtime.version', {});
  else if (command === 'diagnostics') result = await call('runtime.diagnostics', {});
  else if (command === 'list') result = await call('conversations.list', await stdin());
  else if (command === 'send') result = await call('messages.send', await stdin());
  else if (command === 'approve') result = await approve(await stdin());
  else fail('INVALID_ARGUMENTS');
  process.stdout.write(JSON.stringify(result) + '\n');
}
if (require.main === module) main(process.argv.slice(2)).catch(error => {
  if (error.code === 'SOCKET_PATH_TOO_LONG') {
    process.stderr.write('SOCKET_PATH_TOO_LONG: set WHATSAPP_CONTROLS_RUNTIME_DIR to a shorter private directory\n'); process.exitCode = 1; return;
  }
  const allowed = ['INVALID_ARGUMENTS', 'INVALID_JSON', 'INVALID_REQUEST', 'TOO_LARGE', 'TTY_REQUIRED', 'APPROVAL_DECLINED', 'APPROVAL_EXPIRED', 'APPROVAL_REQUIRED', 'AMBIGUOUS_TARGET', 'STALE_IDENTITY', 'TARGET_NOT_OBSERVED', 'REQUEST_CONFLICT', 'SERVICE_TIMEOUT', 'BRIDGE_QUARANTINED'];
  process.stderr.write((allowed.includes(error.code) ? error.code : 'CONTROL_REQUEST_FAILED') + '\n'); process.exitCode = 1;
});
module.exports = { main };

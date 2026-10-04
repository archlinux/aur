'use strict';
const fs = require('node:fs');
const path = require('node:path');
const readline = require('node:readline');
const p = require('./private.cjs');
const { sendRequest } = require('./requests.cjs');
const { call } = require('./client.cjs');
function approvalScreen(body, request) {
  const exact = JSON.stringify({ preview: body.preview, request }, null, 2)
    .replace(/[\u007f-\u009f\u061c\u200e\u200f\u2028-\u202e\u2066-\u2069]/gu, character => `\\u${character.charCodeAt(0).toString(16).padStart(4, '0')}`);
  return `Approve this exact WhatsApp action (escaped Unicode is literal data):\n${exact}\nType APPROVE to authorize once (expires in 2 minutes): `;
}
async function approve(input) {
  const request = sendRequest(input), dirs = p.paths();
  const body = await call('approval.prepare', request, dirs.runtime);
  if (body.hash !== p.digest(request) || typeof body.account !== 'string' || typeof body.generation !== 'string' || !Number.isSafeInteger(body.expires)) p.fail('INVALID_RESPONSE');
  const preview = body.preview;
  if (!preview || preview.sending_account !== body.account || typeof preview.recipient_id !== 'string' || !preview.recipient_id || preview.recipient_name !== request.expected_name || preview.recipient_type !== request.expected_type) p.fail('INVALID_RESPONSE');
  let fd;
  try { fd = fs.openSync('/dev/tty', 'r+'); } catch { p.fail('TTY_REQUIRED'); }
  let confirmed = false;
  const inputStream = fs.createReadStream('/dev/tty', { fd, autoClose: false });
  const lines = readline.createInterface({ input: inputStream, terminal: false });
  try {
    fs.writeSync(fd, approvalScreen(body, request));
    confirmed = await new Promise(resolve => {
      const timer = setTimeout(() => resolve(false), 120000);
      lines.once('line', answer => { clearTimeout(timer); resolve(answer === 'APPROVE'); });
      lines.once('close', () => { clearTimeout(timer); resolve(false); });
    });
  } finally { lines.close(); inputStream.destroy(); fs.closeSync(fd); }
  if (!confirmed) p.fail('APPROVAL_DECLINED');
  if (body.expires <= Date.now()) p.fail('APPROVAL_EXPIRED');
  const authority = p.read(path.join(dirs.state, 'approval-key.json')).key;
  const grants = p.directory(path.join(dirs.state, 'grants'));
  p.write(path.join(grants, `${body.hash}.json`), { body, signature: p.mac(authority, body) });
  return { approved: true, request_id: request.request_id, expires_at: body.expires };
}
module.exports = { approve, approvalScreen };

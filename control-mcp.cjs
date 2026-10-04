'use strict';
const { call } = require('./client.cjs');
const versions = ['2025-06-18', '2025-03-26', '2024-11-05'];
const tools = [
  { name: 'conversations.list', description: 'List local/synced conversation summaries. No message bodies or participants. Unknown timestamps are excluded.', inputSchema: { type: 'object', additionalProperties: false, properties: {
    limit: { type: 'integer', minimum: 1, maximum: 100, default: 10 }, age: { type: 'string', pattern: '^([1-9][0-9]{0,2})d$', default: '7d' }, type: { enum: ['chat', 'group', 'all'], default: 'all' }, cursor: { type: 'string' }
  } }, annotations: { readOnlyHint: true } },
  { name: 'messages.send', description: 'Send one exact action previously approved by a human using the separate CLI. Unknown results must never be retried with a new request ID.', inputSchema: { type: 'object', additionalProperties: false, required: ['conversation_id', 'text', 'request_id', 'expected_name', 'expected_type'], properties: {
    conversation_id: { type: 'string', pattern: '^c_[a-f0-9]{64}$' }, text: { type: 'string', minLength: 1, maxLength: 4096 }, request_id: { type: 'string', pattern: '^[A-Za-z0-9_-]{8,128}$' }, expected_name: { type: 'string', maxLength: 512 }, expected_type: { enum: ['chat', 'group'] }
  } }, annotations: { readOnlyHint: false, destructiveHint: true, idempotentHint: true } }
];
function handler(invoke = call) {
  let initialized = false, ready = false;
  return async request => {
    const id = request?.id ?? null;
    const error = (code, message) => ({ jsonrpc: '2.0', id, error: { code, message } });
    if (!request || request.jsonrpc !== '2.0' || typeof request.method !== 'string' || (Object.hasOwn(request, 'id') && !(typeof id === 'string' || Number.isSafeInteger(id)))) return error(-32600, 'Invalid Request');
    if (!Object.hasOwn(request, 'id')) {
      if (request.method === 'notifications/initialized' && initialized) ready = true;
      return null;
    }
    let result;
    switch (request.method) {
      case 'initialize':
        if (initialized || typeof request.params?.protocolVersion !== 'string' || !request.params?.clientInfo || !request.params?.capabilities) return error(-32602, 'Invalid params');
        initialized = true;
        result = { protocolVersion: versions.includes(request.params.protocolVersion) ? request.params.protocolVersion : versions[0], capabilities: { tools: { listChanged: false } }, serverInfo: { name: 'whatsapp-local-controls', version: '1.0.0' } }; break;
      case 'ping': result = {}; break;
      case 'tools/list':
        if (!ready) return error(-32000, 'Not initialized');
        result = { tools }; break;
      case 'tools/call':
        if (!ready) return error(-32000, 'Not initialized');
        if (!tools.some(t => t.name === request.params?.name)) return error(-32602, 'Invalid params');
        try { result = { content: [{ type: 'text', text: JSON.stringify(await invoke(request.params.name, request.params.arguments ?? {})) }] }; }
        catch { result = { isError: true, content: [{ type: 'text', text: 'CONTROL_REQUEST_FAILED' }] }; }
        break;
      default: return error(-32601, 'Method not found');
    }
    return { jsonrpc: '2.0', id, result };
  };
}
async function stdio() {
  const handle = handler(); let buffer = Buffer.alloc(0);
  const emit = value => { if (value) process.stdout.write(JSON.stringify(value) + '\n'); };
  for await (const chunk of process.stdin) {
    buffer = Buffer.concat([buffer, chunk]);
    let end;
    while ((end = buffer.indexOf(10)) >= 0) {
      if (end > 32768) throw new Error('TOO_LARGE');
      const line = buffer.subarray(0, end).toString('utf8'); buffer = buffer.subarray(end + 1);
      let request;
      try { request = JSON.parse(line); } catch { emit({ jsonrpc: '2.0', id: null, error: { code: -32700, message: 'Parse error' } }); continue; }
      emit(await handle(request));
    }
    if (buffer.length > 32768) throw new Error('TOO_LARGE');
  }
  if (buffer.length) emit({ jsonrpc: '2.0', id: null, error: { code: -32700, message: 'Parse error' } });
}
module.exports = { handler, stdio };

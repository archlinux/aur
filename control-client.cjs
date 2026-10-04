'use strict';
const net = require('node:net');
const path = require('node:path');
const { paths, read, fail, socketPath } = require('./private.cjs');
function call(operation, payload, runtime = paths().runtime) {
  const expectedSocket = socketPath(runtime);
  const record = read(path.join(runtime, 'connection.json'));
  if (record.socket !== expectedSocket || typeof record.secret !== 'string' || !/^[a-f0-9]{64}$/.test(record.secret)) fail('INVALID_CONNECTION');
  const text = JSON.stringify({ secret: record.secret, operation, payload }) + '\n';
  if (Buffer.byteLength(text) > 32768) fail('TOO_LARGE');
  return new Promise((resolve, reject) => {
    const socket = net.createConnection(record.socket);
    let buffer = Buffer.alloc(0), finished = false;
    const finish = (error, value) => { if (finished) return; finished = true; socket.destroy(); error ? reject(Object.assign(new Error(error), { code: error })) : resolve(value); };
    socket.setTimeout(25000, () => finish('SERVICE_TIMEOUT'));
    socket.on('connect', () => socket.write(text));
    socket.on('error', () => finish('SERVICE_UNAVAILABLE'));
    socket.on('end', () => finish('SERVICE_UNAVAILABLE'));
    socket.on('data', chunk => {
      buffer = Buffer.concat([buffer, chunk]);
      if (buffer.length > 524288) return finish('TOO_LARGE');
      const end = buffer.indexOf(10); if (end < 0) return;
      try {
        const value = JSON.parse(buffer.subarray(0, end).toString('utf8'));
        if (value.ok === true) finish(null, value.result);
        else finish(typeof value.error === 'string' && /^[A-Z_]{1,40}$/.test(value.error) ? value.error : 'OPERATION_FAILED');
      } catch { finish('INVALID_RESPONSE'); }
    });
  });
}
module.exports = { call };

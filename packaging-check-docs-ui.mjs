import assert from 'node:assert/strict';
import { createHash } from 'node:crypto';
import { createServer } from 'node:http';
import { mkdtemp, mkdir, readFile, writeFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join, resolve } from 'node:path';
import { spawn } from 'node:child_process';

const assets = resolve(process.argv[2]);
const evidence = resolve(process.argv[3]);
await mkdir(evidence, { recursive: true });
const profile = await mkdtemp(join(tmpdir(), 'docs-'));
const files = new Map();
for (const name of ['swagger-ui-bundle.js', 'swagger-ui.css', 'redoc.standalone.js']) {
  files.set(name, await readFile(join(assets, name)));
}
let requests = 0;
const schema = {
  openapi: '3.0.3', info: { title: 'Studio Documentation Packaging Probe', version: '1.0.0' },
  paths: { '/api/ping': { get: { summary: 'Check local response', operationId: 'localPing',
    responses: { 200: { description: 'Local success', content: { 'application/json': {
      schema: { type: 'object', properties: { ok: { type: 'boolean' } } },
    } } } },
  } } },
};
const server = createServer((req, res) => {
  const path = req.url.split('?')[0];
  if (path === '/schema.json') { res.setHeader('Content-Type', 'application/json'); res.end(JSON.stringify(schema)); }
  else if (path === '/api/ping') { requests++; res.setHeader('Content-Type', 'application/json'); res.end('{"ok":true}'); }
  else if (path === '/swagger') { res.setHeader('Content-Type', 'text/html; charset=utf-8'); res.end('<!doctype html><meta charset="utf-8"><link rel="stylesheet" href="/swagger-ui.css"><div id="swagger-ui"></div><script src="/swagger-ui-bundle.js"></script><script>window.ui=SwaggerUIBundle({url:"/schema.json",dom_id:"#swagger-ui",validatorUrl:null,tryItOutEnabled:false})</script>'); }
  else if (path === '/redoc') { res.setHeader('Content-Type', 'text/html; charset=utf-8'); res.end('<!doctype html><meta charset="utf-8"><div id="redoc"></div><script src="/redoc.standalone.js"></script><script>Redoc.init("/schema.json",{disableGoogleFont:true},document.getElementById("redoc"))</script>'); }
  else if (files.has(path.slice(1))) { res.setHeader('Content-Type', path.endsWith('.css') ? 'text/css; charset=utf-8' : 'application/javascript; charset=utf-8'); res.end(files.get(path.slice(1))); }
  else if (path === '/favicon.ico') { res.writeHead(204); res.end(); }
  else { res.writeHead(404); res.end('missing'); }
});
await new Promise(r => server.listen(0, '127.0.0.1', r));
const origin = 'http://127.0.0.1:' + server.address().port;
const stderr = [];
const browser = spawn('chromium', ['--headless', '--no-sandbox', '--disable-dev-shm-usage',
  '--disable-gpu', '--no-first-run', '--no-default-browser-check', '--disable-background-networking',
  '--remote-debugging-port=0', '--user-data-dir=' + profile, 'about:blank']);
browser.stderr.on('data', b => stderr.push(b));
const delay = ms => new Promise(r => setTimeout(r, ms));
let socket; const exceptions = []; let failure = null; let captureFailure;
try {
  let port;
  for (let i = 0; i < 120; i++) {
    try { port = (await readFile(join(profile, 'DevToolsActivePort'), 'utf8')).split('\n')[0]; break; }
    catch { if (browser.exitCode !== null) throw new Error('Chromium exited ' + browser.exitCode); await delay(250); }
  }
  assert(port, 'No private Chromium endpoint');
  const tabs = await (await fetch('http://127.0.0.1:' + port + '/json/list')).json();
  const tab = tabs.find(t => t.type === 'page'); assert(tab);
  socket = new WebSocket(tab.webSocketDebuggerUrl);
  await new Promise((resolve, reject) => { socket.addEventListener('open', resolve, { once: true }); socket.addEventListener('error', reject, { once: true }); });
  let seq = 0; const pending = new Map();
  socket.addEventListener('message', ({ data }) => {
    const message = JSON.parse(data);
    if (message.method === 'Runtime.exceptionThrown') exceptions.push(message.params);
    if (message.id && pending.has(message.id)) {
      const p = pending.get(message.id); pending.delete(message.id); clearTimeout(p.timer);
      if (message.error) p.reject(new Error(JSON.stringify(message.error))); else p.resolve(message.result);
    }
  });
  function send(method, params = {}) {
    return new Promise((resolve, reject) => {
      const id = ++seq; const timer = setTimeout(() => { pending.delete(id); reject(new Error('CDP timeout ' + method)); }, 30000);
      pending.set(id, { resolve, reject, timer }); socket.send(JSON.stringify({ id, method, params }));
    });
  }
  async function evaluate(expression) {
    const r = await send('Runtime.evaluate', { expression, returnByValue: true, awaitPromise: true });
    assert(!r.exceptionDetails, JSON.stringify(r.exceptionDetails)); return r.result.value;
  }
  async function waitFor(expression) {
    for (let i = 0; i < 120; i++) { if (await evaluate("Boolean(" + expression + ")")) return; await delay(250); }
    throw new Error('DOM condition timeout: ' + expression);
  }
  captureFailure = async () => {
    await writeFile(join(evidence, 'failure-dom.html'), await evaluate('document.documentElement.outerHTML'));
    await writeFile(join(evidence, 'failure.png'), Buffer.from((await send('Page.captureScreenshot', { format: 'png' })).data, 'base64'));
  };
  await send('Runtime.enable'); await send('Page.enable');
  await send('Page.navigate', { url: origin + '/swagger' });
  await waitFor('document.querySelector("button.opblock-summary-control") && document.body.innerText.includes("Studio Documentation Packaging Probe")');
  await evaluate('document.querySelector("button.opblock-summary-control").click()');
  await waitFor('document.querySelector(".try-out__btn")');
  await evaluate('document.querySelector(".try-out__btn").click()');
  await waitFor('document.querySelector("button.execute")');
  await evaluate('document.querySelector("button.execute").click()');
  await waitFor('document.querySelector(".live-responses-table")?.innerText.includes("true")');
  assert.equal(requests, 1);
  await writeFile(join(evidence, 'swagger.png'), Buffer.from((await send('Page.captureScreenshot', { format: 'png' })).data, 'base64'));
  await send('Page.navigate', { url: origin + '/redoc' });
  await waitFor('document.querySelector("h1")?.innerText.includes("Studio Documentation Packaging Probe") && document.body.innerText.includes("Check local response") && document.body.innerText.includes("Local success")');
  await writeFile(join(evidence, 'redoc.png'), Buffer.from((await send('Page.captureScreenshot', { format: 'png' })).data, 'base64'));
  assert.deepEqual(exceptions, []);
  const result = { status: 'REBUILT_DOCS_BROWSER_FUNCTIONAL_PASS', local_requests: requests,
    swagger: 'schema rendered, endpoint expanded and real local Try it out request returned expected JSON',
    redoc: 'schema title, operation and response rendered from local rebuilt bundle',
    inputs: Object.fromEntries([...files].map(([n, b]) => [n, createHash('sha256').update(b).digest('hex')])),
    chromium: await send('Browser.getVersion'), exceptions };
  await writeFile(join(evidence, 'browser-result.json'), JSON.stringify(result, null, 2) + '\n');
  console.log(result.status);
} catch (error) {
  failure = { message: error.message, stack: error.stack };
  try { await captureFailure?.(); } catch (diagnosticError) { failure.capture_error = diagnosticError.message; }
  throw error;
} finally {
  await writeFile(join(evidence, 'browser-diagnostic.json'), JSON.stringify({ exceptions, failure, local_requests: requests }, null, 2) + '\n');
  socket?.close(); browser.kill('SIGTERM'); server.closeAllConnections(); await new Promise(r => server.close(r));
  if (browser.exitCode === null) await Promise.race([new Promise(r => browser.once('exit', r)), delay(5000)]);
  if (browser.exitCode === null) browser.kill('SIGKILL');
  await writeFile(join(evidence, 'chromium-stderr'), Buffer.concat(stderr));
  await rm(profile, { recursive: true, force: true });
}

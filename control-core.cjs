'use strict';
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const p = require('./private.cjs');
const { sendRequest, listRequest } = require('./requests.cjs');
class Controls {
  constructor(state, bridge, now = Date.now) {
    this.state = p.directory(state); this.bridge = bridge; this.now = now;
    this.idKey = p.key(path.join(state, 'identity-key.json'));
    this.authority = p.key(path.join(state, 'approval-key.json'));
    this.grants = p.directory(path.join(state, 'grants')); this.ledger = p.directory(path.join(state, 'ledger'));
    this.cursors = new Map(); this.observed = new Map(); this.pending = new Map(); this.queues = new Map();
  }
  async snapshot() {
    const s = await this.bridge('snapshot', {});
    if (!s || typeof s.generation !== 'string' || typeof s.account !== 'string' || !s.generation || !s.account || !Number.isSafeInteger(s.observed_at) || !Array.isArray(s.conversations) || s.conversations.length > 10000) p.fail('INVALID_SNAPSHOT');
    const seen = new Set();
    const conversations = s.conversations.map(c => {
      if (!c || typeof c.id !== 'string' || !c.id || c.id.length > 1024 || seen.has(c.id) || typeof c.name !== 'string' || c.name.length > 512 || !['chat', 'group'].includes(c.type) || !(c.last_activity === null || Number.isSafeInteger(c.last_activity)) || (c.unread !== undefined && (!Number.isSafeInteger(c.unread) || c.unread < 0))) p.fail('INVALID_SNAPSHOT');
      seen.add(c.id);
      return { ...c, conversation_id: `c_${p.mac(this.idKey, [s.account, c.id])}` };
    });
    return { ...s, conversations };
  }
  summary(c) { return { conversation_id: c.conversation_id, name: c.name, type: c.type, last_activity: c.last_activity, ...(c.unread === undefined ? {} : { unread: c.unread }) }; }
  preview(s, c) {
    if (s.conversations.filter(other => other.name === c.name && other.type === c.type).length !== 1) p.fail('AMBIGUOUS_TARGET');
    return { sending_account: s.account, recipient_id: c.id, recipient_name: c.name, recipient_type: c.type };
  }
  async list(input) {
    const filters = listRequest(input), now = this.now();
    for (const [token, page] of this.cursors) if (page.expires <= now) this.cursors.delete(token);
    let page;
    if (input.cursor) {
      page = this.cursors.get(input.cursor);
      if (!page || p.digest(filters) !== page.filters) p.fail('INVALID_CURSOR');
      const current = await this.snapshot();
      if (current.account !== page.account || current.generation !== page.generation) p.fail('STALE_SNAPSHOT');
    } else {
      const s = await this.snapshot();
      const matching = s.conversations.filter(c => filters.type === 'all' || c.type === filters.type);
      page = { account: s.account, generation: s.generation, observed_at: s.observed_at, expires: now + 60000, offset: 0, filters: p.digest(filters),
        unknown: matching.filter(c => c.last_activity === null).length,
        rows: matching.filter(c => c.last_activity !== null && c.last_activity >= now - Number(filters.age.slice(0, -1)) * 86400000)
          .sort((a, b) => b.last_activity - a.last_activity || (a.conversation_id < b.conversation_id ? -1 : 1)) };
    }
    const rows = page.rows.slice(page.offset, page.offset + filters.limit);
    for (const c of rows) this.observed.set(c.conversation_id, { account: page.account, generation: page.generation, name: c.name, type: c.type, expires: page.expires });
    for (const [id, target] of this.observed) if (target.expires <= now) this.observed.delete(id);
    let cursor = null;
    if (page.offset + rows.length < page.rows.length) {
      if (this.cursors.size >= 128) p.fail('CAPACITY');
      cursor = crypto.randomBytes(24).toString('hex');
      this.cursors.set(cursor, { ...page, offset: page.offset + rows.length });
    }
    return { conversations: rows.map(c => this.summary(c)), cursor, observed_at: page.observed_at, coverage: 'local/synced', unknown_timestamps_excluded: page.unknown, snapshot_expires_at: page.expires };
  }
  send(input) {
    const request = sendRequest(input), hash = p.digest(request), id = p.digest(request.request_id);
    const active = this.pending.get(id);
    if (active) { if (active.hash !== hash) p.fail('REQUEST_CONFLICT'); return active.promise; }
    const previous = this.queues.get(request.conversation_id) || Promise.resolve();
    const promise = previous.catch(() => {}).then(() => this.dispatch(request, hash, id));
    this.pending.set(id, { hash, promise }); this.queues.set(request.conversation_id, promise);
    promise.finally(() => { this.pending.delete(id); if (this.queues.get(request.conversation_id) === promise) this.queues.delete(request.conversation_id); }).catch(() => {});
    return promise;
  }
  async dispatch(request, hash, id) {
    const file = path.join(this.ledger, `${id}.json`);
    try {
      const prior = p.read(file);
      if (prior.hash !== hash) p.fail('REQUEST_CONFLICT');
      return { request_id: request.request_id, state: prior.state === 'queued' || prior.state === 'dispatching' ? 'unknown' : prior.state };
    } catch (e) { if (e.code !== 'ENOENT') throw e; }
    const observed = this.observed.get(request.conversation_id);
    if (!observed || observed.expires <= this.now()) p.fail('TARGET_NOT_OBSERVED');
    const s = await this.snapshot(), c = s.conversations.find(c => c.conversation_id === request.conversation_id);
    if (!c || s.account !== observed.account || s.generation !== observed.generation || c.name !== observed.name || c.type !== observed.type || c.name !== request.expected_name || c.type !== request.expected_type) p.fail('STALE_IDENTITY');
    const preview = this.preview(s, c);
    const grantFile = path.join(this.grants, `${hash}.json`);
    let grant;
    try { grant = p.read(grantFile); } catch { p.fail('APPROVAL_REQUIRED'); }
    const body = grant.body;
    if (!body || !body.preview || grant.signature !== p.mac(this.authority, body) || p.digest(body.preview) !== p.digest(preview) || body.hash !== hash || body.account !== s.account || body.generation !== s.generation || !Number.isSafeInteger(body.expires) || body.expires <= this.now() || body.expires > this.now() + 300000) p.fail('APPROVAL_REQUIRED');
    p.write(file, { hash, state: 'queued' });
    fs.renameSync(grantFile, `${grantFile}.consumed`); p.syncDir(this.grants);
    p.write(file, { hash, state: 'dispatching' });
    let state = 'unknown';
    try {
      const result = await this.bridge('send', { generation: s.generation, account: s.account, id: c.id, name: c.name, type: c.type, text: request.text });
      if (['submitted', 'server_ack', 'delivered'].includes(result?.state)) state = result.state;
    } catch { /* Dispatch uncertainty is terminal, never retry. */ }
    p.write(file, { hash, state });
    return { request_id: request.request_id, state };
  }
  async prepare(input) {
    const request = sendRequest(input), observed = this.observed.get(request.conversation_id);
    const s = await this.snapshot(), c = s.conversations.find(c => c.conversation_id === request.conversation_id);
    if (!observed || observed.expires <= this.now() || !c || observed.account !== s.account || observed.generation !== s.generation || c.name !== request.expected_name || c.type !== request.expected_type || c.name !== observed.name || c.type !== observed.type) p.fail('STALE_IDENTITY');
    const preview = this.preview(s, c);
    const expires = this.now() + 120000;
    this.observed.set(request.conversation_id, { ...observed, expires });
    return { hash: p.digest(request), account: s.account, generation: s.generation, expires, preview };
  }
}
module.exports = { Controls };

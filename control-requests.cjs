'use strict';
const { fail } = require('./private.cjs');
function fields(value, allowed, required = allowed) {
  if (!value || typeof value !== 'object' || Array.isArray(value) || Object.keys(value).some(k => !allowed.includes(k)) || required.some(k => !Object.hasOwn(value, k))) fail('INVALID_REQUEST');
}
function sendRequest(value) {
  fields(value, ['conversation_id', 'text', 'request_id', 'expected_name', 'expected_type']);
  if (!/^c_[a-f0-9]{64}$/.test(value.conversation_id) || typeof value.conversation_id !== 'string' ||
      typeof value.request_id !== 'string' || !/^[A-Za-z0-9_-]{8,128}$/.test(value.request_id) ||
      typeof value.text !== 'string' || value.text.length < 1 || value.text.length > 4096 || !value.text.trim() ||
      typeof value.expected_name !== 'string' || value.expected_name.length > 512 ||
      !['chat', 'group'].includes(value.expected_type)) fail('INVALID_REQUEST');
  return { conversation_id: value.conversation_id, text: value.text, request_id: value.request_id, expected_name: value.expected_name, expected_type: value.expected_type };
}
function listRequest(value) {
  fields(value, ['limit', 'age', 'type', 'cursor'], []);
  const limit = value.limit ?? 10, age = value.age ?? '7d', type = value.type ?? 'all';
  if (!Number.isInteger(limit) || limit < 1 || limit > 100 || typeof age !== 'string' || !/^([1-9][0-9]{0,2})d$/.test(age) || Number(age.slice(0, -1)) > 365 || !['all', 'chat', 'group'].includes(type) || (value.cursor !== undefined && (typeof value.cursor !== 'string' || !/^[a-f0-9]{48}$/.test(value.cursor)))) fail('INVALID_REQUEST');
  return { limit, age, type };
}
function diagnosticsResult(value) {
  const allowed = ['total', 'direct_ids', 'group_ids', 'metadata', 'metadata_type', 'metadata_parent_false', 'community', 'linked', 'named', 'activity'];
  for (const field of ['isUser', 'isBroadcast', 'isNewsletter', 'isParentGroup', 'canSend', 'isReadOnly']) {
    for (const suffix of ['true', 'false', 'undefined']) allowed.push(`${field}_${suffix}`);
  }
  fields(value, allowed);
  if (Object.values(value).some(count => !Number.isSafeInteger(count) || count < 0 || count > 10000)) fail('INVALID_SNAPSHOT');
  return value;
}
module.exports = { fields, sendRequest, listRequest, diagnosticsResult };

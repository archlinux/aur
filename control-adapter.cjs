'use strict';

// Runs only in the unprivileged WhatsApp main world. No Node or IPC is exposed.
function installAdapter(expectedVersion) {
  const wpp = window.WPP;
  if (!wpp || wpp.version !== '4.6.0' || !wpp.isFullReady) return false;
  if (window.__whatsappControls) return true;
  const methods = ['isAuthenticated', 'isMainReady', 'isOnline', 'getMyUserId', 'getBuildConstants'];
  if (methods.some((key) => typeof wpp.conn?.[key] !== 'function') ||
      typeof wpp.chat?.list !== 'function' || typeof wpp.chat?.sendTextMessage !== 'function' ||
      typeof wpp.on !== 'function') return false;
  let epoch = 0;
  for (const event of ['conn.logout', 'conn.require_auth', 'conn.main_init',
    'conn.authenticated', 'conn.online', 'conn.stream_mode_changed', 'conn.needs_update']) {
    wpp.on(event, () => { epoch += 1; });
  }
  function state() {
    if (location.origin !== 'https://web.whatsapp.com' || window !== window.top ||
        !wpp.isFullReady || !wpp.conn.isAuthenticated() || !wpp.conn.isMainReady() ||
        !wpp.conn.isOnline() || wpp.conn.getBuildConstants()?.VERSION_STR !== expectedVersion) {
      throw new Error('NOT_READY');
    }
    const account = wpp.conn.getMyUserId()?._serialized;
    if (typeof account !== 'string' || account.length > 160) throw new Error('NOT_READY');
    return { account, epoch };
  }
  function same(a, b) {
    return a.account === b.account && a.epoch === b.epoch;
  }
  function summary(chat) {
    if (chat.isBroadcast === true || chat.isNewsletter === true ||
        chat.isParentGroup === true || chat.groupType === 'COMMUNITY' ||
        chat.groupMetadata?.groupType === 'COMMUNITY') return null;
    const id = chat.id?._serialized;
    if (typeof id !== 'string' || id.length > 160) throw new Error('INCOMPATIBLE');
    let type;
    if (chat.isUser === true && /@(c\.us|lid)$/.test(id)) type = 'chat';
    else if (chat.id.isGroup() && id.endsWith('@g.us') &&
      chat.isParentGroup === false && chat.groupMetadata?.isParentGroup === false &&
      !chat.groupMetadata.parentGroup && !chat.groupMetadata.parentGroupId) type = 'group';
    else return null;
    const name = chat.formattedTitle ?? chat.name;
    if (typeof name !== 'string' || !name || name.length > 512) return null;
    const last_activity = Number.isSafeInteger(chat.t) && chat.t > 0 &&
      chat.t * 1000 <= Date.now() + 60000 ? chat.t * 1000 : null;
    const result = { id, name, type, last_activity };
    if (Number.isSafeInteger(chat.unreadCount) && chat.unreadCount >= 0) {
      result.unread = chat.unreadCount;
    }
    return result;
  }
  async function snapshot() {
    const before = state();
    // Avoid fetching participant metadata. Unclassifiable groups are excluded.
    const chats = await wpp.chat.list({ ignoreGroupMetadata: true });
    if (!Array.isArray(chats) || chats.length > 10000) throw new Error('INCOMPATIBLE');
    const conversations = chats.map(summary).filter(Boolean);
    if (!same(before, state())) throw new Error('STALE');
    return JSON.stringify({ ...before, observed_at: Date.now(), conversations });
  }
  async function diagnostics() {
    const before = state();
    const chats = await wpp.chat.list({ ignoreGroupMetadata: true });
    if (!Array.isArray(chats) || chats.length > 10000) throw new Error('INCOMPATIBLE');
    const counts = { total: chats.length };
    for (const field of ['isUser', 'isBroadcast', 'isNewsletter', 'isParentGroup', 'canSend', 'isReadOnly']) {
      for (const value of [true, false, undefined]) {
        counts[`${field}_${String(value)}`] = chats.filter(chat => chat[field] === value).length;
      }
    }
    counts.direct_ids = chats.filter(chat => /@(c\.us|lid)$/.test(chat.id?._serialized)).length;
    counts.group_ids = chats.filter(chat => chat.id?._serialized?.endsWith('@g.us')).length;
    counts.metadata = chats.filter(chat => chat.groupMetadata).length;
    counts.metadata_type = chats.filter(chat => typeof chat.groupMetadata?.groupType === 'string').length;
    counts.metadata_parent_false = chats.filter(chat => chat.groupMetadata?.isParentGroup === false).length;
    counts.community = chats.filter(chat => chat.groupMetadata?.groupType === 'COMMUNITY').length;
    counts.linked = chats.filter(chat => chat.groupMetadata?.parentGroupId || chat.groupMetadata?.parentGroup).length;
    counts.named = chats.filter(chat => typeof (chat.formattedTitle ?? chat.name) === 'string').length;
    counts.activity = chats.filter(chat => Number.isSafeInteger(chat.t)).length;
    if (!same(before, state())) throw new Error('STALE');
    return JSON.stringify(counts);
  }
  async function send(request) {
    const before = state();
    if (!same(before, request)) throw new Error('STALE');
    const chats = await wpp.chat.list({ ignoreGroupMetadata: true });
    if (!Array.isArray(chats) || chats.length > 10000) throw new Error('INCOMPATIBLE');
    const matches = chats.filter((chat) => chat.id?._serialized === request.id);
    const target = matches.length === 1 ? summary(matches[0]) : null;
    if (!target || target.name !== request.name || target.type !== request.type ||
        matches[0].isReadOnly !== false || matches[0].canSend !== true ||
        !same(before, state())) throw new Error('STALE');
    const result = await wpp.chat.sendTextMessage(request.id, request.text, {
      waitForAck: true, detectMentioned: false, markIsRead: false, linkPreview: false,
    });
    if (!same(before, state())) throw new Error('UNCERTAIN');
    if (typeof result?.id !== 'string' || !Number.isInteger(result.ack) ||
        result.ack < 0 || result.ack > 4) throw new Error('UNCERTAIN');
    return JSON.stringify({ state: result.ack >= 2 ? 'delivered' :
      result.ack === 1 ? 'server_ack' : 'submitted' });
  }
  Object.defineProperty(window, '__whatsappControls', {
    value: Object.freeze({ snapshot, send, diagnostics }), configurable: false, writable: false,
  });
  return true;
}

module.exports = { adapterSource: (version) => `(${installAdapter.toString()})(${JSON.stringify(version)})` };

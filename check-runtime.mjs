/*
 * Downstream runtime canary for the Arch package.
 *
 * Session persistence behavior belongs upstream; this check exists because
 * downstream assembly can still break a correct upstream release by omitting
 * or misassembling runtime/native dependencies.
 *
 * Persistence is a useful canary because it crosses the JavaScript, JSONL
 * persistence, and native locking boundary. Test public behavior rather than
 * addon filenames or implementation details.
 *
 * Module resolution is anchored at the assembled runtime so the check cannot
 * accidentally use dependencies from the packaging or upstream source trees.
 *
 * Upstream should ideally verify equivalent behavior on its packed/installable
 * artifacts. This small downstream check does not replace verification of the
 * final .pkg.tar.zst.
 */

import { mkdtemp, rm } from 'node:fs/promises'
import { createRequire } from 'node:module'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { pathToFileURL } from 'node:url'

const runtimeRoot = process.argv[2]
if (!runtimeRoot) throw new Error('usage: node check-runtime.mjs <runtime-root>')

// Anchor Node resolution at the assembled npm runtime, not beside this
// packaging helper or in the upstream source workspace.
const require = createRequire(join(runtimeRoot, 'package.json'))

async function load(name) {
  // Resolve through the anchored CommonJS resolver, then import the exact
  // resulting module as ESM.
  return import(pathToFileURL(require.resolve(name)).href)
}

const { Context } = await load('@deepseek-ai/cordis')
const { default: JsonlSessionPersistence } =
  await load('@deepseek-ai/dsh-session-persistence-jsonl')
const { SESSION_FORMAT_VERSION, SessionId } =
  await load('@deepseek-ai/dsh-session')

// Use an isolated persistence root so the check cannot read or mutate the
// user's real DSH sessions or configuration.
const root = await mkdtemp(join(tmpdir(), 'dsh-aur-smoke-'))

try {
  const ctx = new Context()
  await ctx.plugin(JsonlSessionPersistence, {
    root,
    compression: 'none',
  })

  // Exercise behavior through the public Session persistence abstraction.
  // Creating, closing, and reopening forces the assembled runtime through the
  // persistence/native-locking path without asserting addon internals.
  const id = SessionId('aur-packaging-smoke')
  const created = await ctx.sessionPersistence.create({
    version: SESSION_FORMAT_VERSION,
    id,
    createdAt: Date.now(),
    isSeeded: false,
    cwd: '/tmp',
  })

  await created.flush()
  await created.close()

  const reopened = await ctx.sessionPersistence.open(id, 'read')
  const result = await reopened.read()

  if (reopened.header.id !== id || result.events.length !== 0) {
    throw new Error('Session persistence round-trip failed')
  }

  await reopened.close()
  console.log('Session persistence smoke passed')
} finally {
  await rm(root, { recursive: true, force: true })
}

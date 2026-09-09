import { mkdtemp, rm } from 'node:fs/promises'
import { createRequire } from 'node:module'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { pathToFileURL } from 'node:url'

const runtimeRoot = process.argv[2]
if (!runtimeRoot) throw new Error('usage: node check-runtime.mjs <runtime-root>')

const require = createRequire(join(runtimeRoot, 'package.json'))

async function load(name) {
  return import(pathToFileURL(require.resolve(name)).href)
}

const { Context } = await load('@deepseek-ai/cordis')
const { default: JsonlSessionPersistence } =
  await load('@deepseek-ai/dsh-session-persistence-jsonl')
const { SESSION_FORMAT_VERSION, SessionId } =
  await load('@deepseek-ai/dsh-session')

const root = await mkdtemp(join(tmpdir(), 'dsh-aur-smoke-'))

try {
  const ctx = new Context()
  await ctx.plugin(JsonlSessionPersistence, {
    root,
    compression: 'none',
  })

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

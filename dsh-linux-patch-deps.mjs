#!/usr/bin/env node
/**
 * Build-time fixes to installed dependencies (node_modules only; upstream
 * source is untouched). Each fix is guarded: if the code no longer matches,
 * it is skipped with a warning, never a failure.
 *
 * Vendored from ethanrise/dsh-desktop (linux/patch-deps.mjs, MIT, Copyright (c) 2026 DataElement; see LICENSE.ethanrise) so the AUR
 * build does not depend on network access to GitHub.
 *
 * libreoffice-kit: on Linux it is meant to fall back to its WASM engine when
 * no native engine package is installed. Its "is the package present" probe
 * compares `lstatSync(p, { throwIfNoEntry: false }) !== undefined`, but
 * Electron's asar fs returns `null` for a missing path inside app.asar, so the
 * missing native package is reported as "installed but incomplete" and the
 * WASM fallback is never reached. Compare with `!= null` instead.
 *
 * Usage: node patch-deps.mjs <upstream checkout>
 */
import { readFile, writeFile } from 'node:fs/promises'
import { join, resolve } from 'node:path'

const project = resolve(process.argv[2] ?? '.')
const kit = join(project, 'node_modules/@deepseek-ai/libreoffice-kit/lib')
const before = 'lstatSync(join(directory, name), { throwIfNoEntry: false }) !== void 0'
const after = 'lstatSync(join(directory, name), { throwIfNoEntry: false }) != null'

for (const file of ['cli.js', 'index.js']) {
  const path = join(kit, file)
  let source
  try { source = await readFile(path, 'utf8') } catch { console.log(`::warning::libreoffice-kit ${file} not found; skipping asar probe fix`); continue }
  if (source.includes(after)) { console.log(`libreoffice-kit ${file}: already fixed`); continue }
  if (!source.includes(before)) { console.log(`::warning::libreoffice-kit ${file}: probe code changed; skipping asar probe fix`); continue }
  await writeFile(path, source.replace(before, after))
  console.log(`libreoffice-kit ${file}: patched asar package probe`)
}

/** Linux has no Office runtime; the profile must not require the plugin.
 *  `dsh-desktop-office` is inserted as a profile composition entry and fails
 *  activation with ENOENT when the payload is absent, aborting Harness boot.
 *  Drop that insert block (it is optional by design; Safe Mode omits it too).
 */
async function patchProfilePatch() {
  const path = join(project, 'build/dsh-desktop.patch.yml')
  let source
  try { source = await readFile(path, 'utf8') } catch { console.log('::warning::build/dsh-desktop.patch.yml not found; skipping office composition fix'); return }
  if (!source.includes('dsh-desktop-office')) { console.log('dsh-desktop.patch.yml: office entry already absent'); return }
  const lines = source.split('\n')
  const idIndex = lines.findIndex(line => /^\s+- id: dsh-desktop-office\s*$/.test(line))
  if (idIndex === -1) { console.log('::warning::office entry not in expected form; skipping'); return }
  let start = idIndex
  while (start > 0 && !/^- insert:\s*$/.test(lines[start])) start--
  if (!/^- insert:\s*$/.test(lines[start])) { console.log('::warning::no enclosing insert block; skipping'); return }
  let commentStart = start
  while (commentStart > 0 && lines[commentStart - 1].startsWith('# Offline Office')) commentStart--
  let end = start + 1
  while (end < lines.length && (lines[end] === '' || /^\s+/.test(lines[end]))) end++
  const block = lines.slice(start, end).join('\n')
  if (!block.includes('dsh-desktop-office')) { console.log('::warning::unexpected block layout; skipping'); return }
  lines.splice(commentStart, end - commentStart)
  await writeFile(path, `${lines.join('\n')}\n`)
  console.log('dsh-desktop.patch.yml: removed dsh-desktop-office composition (no Linux Office runtime)')
}

await patchProfilePatch()

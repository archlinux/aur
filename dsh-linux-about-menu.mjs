#!/usr/bin/env node
/**
 * Linux build: keep the About panel read-only.
 *
 * Up to v0.13.x upstream only exposed "About DSH Desktop" in the macOS app
 * menu; this helper added an item to the Linux menu. v0.14.0 renders a custom
 * window caption on Linux (the native menu bar is hidden), so the menu item is
 * gone; the About panel itself now ships an entry point from that caption.
 *
 * What remains: the panel's "版本切换 / Switch version" button lists installable
 * releases from the update catalog. Arch packages are installed and upgraded by
 * pacman, so switching builds from inside the app would desync the package;
 * drop the button and leave the version line and OK button.
 *
 * Guarded like the other helpers: when the source no longer matches, warn and
 * skip instead of failing the build.
 *
 * Usage: node dsh-linux-about-menu.mjs <upstream checkout>
 */
import { readFile, writeFile } from 'node:fs/promises'
import { join, resolve } from 'node:path'

const project = resolve(process.argv[2] ?? '.')
const file = join(project, 'src/preload/desktop-update-ui.ts')
const marker = '// linux-about-hide-switch'
const before = `  switcher.appendChild(selectVersionBtn)
  header.appendChild(switcher)`
const after = `  ${marker}: release catalogs only carry packaged installers,
  // so version switching must stay with pacman on Arch.
  header.appendChild(switcher)`

let source
try { source = await readFile(file, 'utf8') } catch {
  console.log('::warning::src/preload/desktop-update-ui.ts not found; skipping About panel fix')
  process.exit(0)
}
if (source.includes(marker)) { console.log('About panel version switch: already applied'); process.exit(0) }
if (!source.includes(before)) { console.log('::warning::About panel changed upstream; skipping version switch fix'); process.exit(0) }
await writeFile(file, source.replace(before, after))
console.log('About panel version switch: patched')

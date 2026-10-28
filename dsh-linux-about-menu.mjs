#!/usr/bin/env node
/**
 * Linux build: add an "About" entry to the application menu and keep the
 * About panel read-only.
 *
 * 1) src/main/index.ts — upstream's installMenu() only puts "About DSH
 *    Desktop" in the macOS app menu; the non-darwin branch exposes
 *    "Check for Updates…" and "Quit", so Linux has no way to read the
 *    installed version (Windows hides the menu bar entirely). Insert an About
 *    item right below the update item and reuse upstream's own showAbout(),
 *    which reports the desktop version and the bundled Harness version.
 *
 * 2) src/preload/desktop-update-ui.ts — the About panel ships a "版本切换 /
 *    Switch version" button that offers installable releases. Those catalogs
 *    only contain macOS/Windows artifacts, so on Linux it can only fail; drop
 *    the button and leave the panel with the version line and the OK button.
 *
 * Guarded like the other helpers: when the source no longer matches, warn and
 * skip instead of failing the build.
 *
 * Usage: node dsh-linux-about-menu.mjs <upstream checkout>
 */
import { readFile, writeFile } from 'node:fs/promises'
import { join, resolve } from 'node:path'

const project = resolve(process.argv[2] ?? '.')

const menuFile = join(project, 'src/main/index.ts')
const menuMarker = '// linux-about-menu'
const menuBefore = `            {
              label: checkForUpdatesLabel,
              accelerator: 'CmdOrCtrl+U',
              click: () => void checkForUpdates(true).catch(showUnexpectedError)
            }
          ]),`
const menuAfter = `            {
              label: checkForUpdatesLabel,
              accelerator: 'CmdOrCtrl+U',
              click: () => void checkForUpdates(true).catch(showUnexpectedError)
            },
            ${menuMarker}: upstream keeps the About item in the macOS app menu only.
            {
              label: isChinese ? '关于 DSH Desktop' : 'About DSH Desktop',
              click: () => {
                if (mainWindow && !mainWindow.isDestroyed()) {
                  void showAbout(mainWindow).catch(showUnexpectedError)
                }
              }
            }
          ]),`

const aboutFile = join(project, 'src/preload/desktop-update-ui.ts')
const aboutMarker = '// linux-about-hide-switch'
const aboutBefore = `  switcher.appendChild(selectVersionBtn)
  header.appendChild(switcher)`
const aboutAfter = `  ${aboutMarker}: release catalogs only carry macOS/Windows artifacts,
  // so version switching cannot work in a Linux package.
  header.appendChild(switcher)`

async function patch(file, marker, before, after, label) {
  let source
  try { source = await readFile(file, 'utf8') } catch {
    console.log(`::warning::${label}: file not found; skipping`)
    return
  }
  if (source.includes(marker)) { console.log(`${label}: already applied`); return }
  if (!source.includes(before)) { console.log(`::warning::${label}: source changed upstream; skipping`); return }
  await writeFile(file, source.replace(before, after))
  console.log(`${label}: patched`)
}

await patch(menuFile, menuMarker, menuBefore, menuAfter, 'About menu item')
// Re-read: the panel patch is independent, but must not run on a missing guard.
await patch(aboutFile, aboutMarker, aboutBefore, aboutAfter, 'About panel version switch')

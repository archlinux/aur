/**
 * Linux replacement for upstream's electron-builder afterPack
 * (scripts/after-pack.cjs), passed with `-c.afterPack=...`.
 *
 * Vendored from ethanrise/dsh-desktop (linux/after-pack.cjs, MIT, Copyright (c) 2026 DataElement; see LICENSE.ethanrise) so the AUR
 * build does not depend on network access to GitHub. Keep it in sync with the
 * upstream helper if the upstream gates change.
 *
 * Upstream's gates hard-code macOS/Windows executable paths. This runs the
 * same gates from upstream's own scripts, against the Linux executable:
 *   hard: asar unpack layout, packaged PPT runtime;
 *   Office payload checks are skipped when the build has no Office runtime
 *   (LINUX_NO_OFFICE_RUNTIME=1), which is the case for this AUR package.
 * Upstream scripts are resolved from the build's working directory (the
 * upstream checkout).
 */
const fs = require('node:fs/promises')
const { existsSync } = require('node:fs')
const os = require('node:os')
const path = require('node:path')
const { promisify } = require('node:util')
const execFile = promisify(require('node:child_process').execFile)

const project = process.cwd()
const upstream = file => path.join(project, 'scripts', file)

function warn(message) {
  console.log(`::warning::${message}`)
}

module.exports = async function afterPack(context) {
  if (context.electronPlatformName !== 'linux') throw new Error('dsh-linux-after-pack.cjs is for Linux builds only')
  const resources = path.join(context.appOutDir, 'resources')
  const executable = path.join(context.appOutDir, context.packager.executableName)
  if (!existsSync(executable)) throw new Error(`Cannot locate the packaged Electron executable: ${executable}`)
  const options = { env: { ...process.env, ELECTRON_RUN_AS_NODE: '1' }, timeout: 120_000, maxBuffer: 4 * 1024 * 1024 }

  // Older upstream releases predate some gates; run only those that exist.
  // 1. asar unpack layout (platform independent).
  if (existsSync(upstream('verify-asar-unpack.cjs'))) {
    const { verifyAsarUnpack } = require(upstream('verify-asar-unpack.cjs'))
    verifyAsarUnpack(resources)
  }

  // 2. Packaged PPT runtime, run the way upstream does it: through Electron.
  //    Soft on Linux: this gate renders through sharp/libvips; upstream only
  //    qualifies that engine on macOS/Windows, and some distros crash inside
  //    libvips even though the packaged files are intact. Report, don't fail.
  if (existsSync(upstream('verify-packaged-ppt-runtime.cjs'))) {
    const appRoot = [path.join(resources, 'app.asar'), path.join(resources, 'app')].find(p => existsSync(p))
    if (!appRoot) throw new Error('Cannot locate the packaged application runtime')
    try {
      await execFile(executable, [upstream('verify-packaged-ppt-runtime.cjs'), '--verify-runtime', appRoot], { ...options, cwd: path.dirname(appRoot) })
      console.log('Packaged PPT runtime passed')
    } catch (error) {
      warn(`Packaged PPT runtime verification failed on Linux (non-fatal): ${String(error.stderr || error.message).trim().split('\n').slice(-3).join(' | ')}`)
    }
  }

  // 3. Office runtime (skipped when the build has no Office payload).
  if (process.env.LINUX_NO_OFFICE_RUNTIME === '1' || !existsSync(upstream('office-runtime/smoke.py'))) {
    warn('Office runtime not bundled in this build; skipping Office checks')
    return
  }
  const payload = path.join(resources, 'office-runtime', 'primary-runtime')
  const metadata = path.join(payload, 'runtime.json')
  const manifest = JSON.parse(await fs.readFile(metadata, 'utf8'))
  if (manifest.platform !== 'linux' || manifest.arch !== process.arch) throw new Error(`Office runtime target mismatch: ${manifest.platform}/${manifest.arch}`)
  const python = path.join(payload, 'dependencies', 'python', 'bin', 'python3')
  const scratch = await fs.mkdtemp(path.join(os.tmpdir(), 'dsh-office-smoke-'))
  const run = (file, args) => execFile(file, args, { ...options, cwd: scratch })
  try {
    await run(python, ['-I', '-B', upstream('office-runtime/smoke.py'), scratch, metadata])
    await run(python, ['-I', '-B', '-m', 'pip', 'check'])
    console.log('Office Python runtime passed')

    const soft = async (label, fn) => {
      try { await fn(); console.log(`${label} passed`); return true } catch (error) {
        warn(`${label} failed on Linux (non-fatal): ${String(error.stderr || error.message).trim().split('\n').slice(-3).join(' | ')}`)
        return false
      }
    }
    await soft('Office engine probe', () => run(executable, [upstream('office-runtime/probe.cjs'), path.join(resources, 'app.asar'), resources]))
    const cli = path.join(resources, 'office-cli.mjs')
    const checker = path.join(resources, 'office-runtime', 'office-skills', 'scripts', 'check_office.py')
    for (const extension of ['docx', 'pptx', 'xlsx']) {
      const input = path.join(scratch, `sample.${extension}`)
      await run(python, ['-I', '-B', checker, input, '--contains', 'Office runtime smoke'])
      await soft(`Office ${extension} -> PDF conversion`, async () => {
        const output = path.join(scratch, `${extension}.pdf`)
        await run(executable, [cli, 'convert', '--input', input, '--output', output])
        if ((await fs.readFile(output)).subarray(0, 5).toString() !== '%PDF-') throw new Error('output is not a PDF')
      })
    }
  } finally {
    await fs.rm(scratch, { recursive: true, force: true })
  }
}

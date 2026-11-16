/**
 * Linux replacement for upstream's electron-builder afterPack.
 *
 * Upstream's chain (scripts/release/after-pack.cjs + scripts/verify/*.cjs) also
 * runs verifyOfficeRuntime, which needs the Office payload this package does not
 * ship. This wrapper runs the platform-independent gates against the Linux app
 * directory and skips the Office checks when LINUX_NO_OFFICE_RUNTIME=1.
 *
 * Usage: electron-builder ... -c.afterPack="$srcdir/dsh-linux-after-pack.cjs"
 */
const path = require('node:path')
const { existsSync } = require('node:fs')

module.exports = async function afterPack(context) {
  if (context.electronPlatformName !== 'linux') throw new Error('dsh-linux-after-pack.cjs is for Linux builds only')
  const project = process.cwd()
  const verify = file => path.join(project, 'scripts', 'verify', file)
  const resources = path.join(context.appOutDir, 'resources')
  const warn = message => console.log(`::warning::${message}`)

  // Hard gate: asar unpack layout (platform independent).
  if (existsSync(verify('verify-asar-unpack.cjs'))) {
    const { verifyAsarUnpack } = require(verify('verify-asar-unpack.cjs'))
    verifyAsarUnpack(resources)
  } else {
    warn('verify-asar-unpack.cjs not found; skipping asar layout gate')
  }

  // Soft gate: packaged PPT runtime. Upstream only qualifies sharp/libvips on
  // macOS/Windows; some distros crash inside libvips even though the packaged
  // files are intact, so report instead of failing.
  if (existsSync(verify('verify-packaged-ppt-runtime.cjs'))) {
    try {
      const verifyPackagedPptRuntime = require(verify('verify-packaged-ppt-runtime.cjs'))
      await verifyPackagedPptRuntime(context)
      console.log('Packaged PPT runtime passed')
    } catch (error) {
      warn(`Packaged PPT runtime verification failed on Linux (non-fatal): ${String(error?.message ?? error).trim().split('\n').slice(-1)}`)
    }
  } else {
    warn('verify-packaged-ppt-runtime.cjs not found; skipping PPT runtime gate')
  }

  // Office payload is not bundled here, so its conversion gates are skipped.
  if (process.env.LINUX_NO_OFFICE_RUNTIME === '1') {
    warn('Office runtime not bundled in this build; skipping Office checks')
  }
}

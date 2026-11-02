const assert = require('node:assert/strict')
const fs = require('node:fs')
const os = require('node:os')
const path = require('node:path')
const { spawnSync } = require('node:child_process')
const { test } = require('node:test')

const launcher = fs.readFileSync(process.env.HERMES_LAUNCHER_PATH || path.join(__dirname, 'hermes-desktop'), 'utf8')

function runLauncher(t, browsers = []) {
  const home = fs.mkdtempSync(path.join(os.tmpdir(), 'hermes-launcher-test-'))
  t.after(() => fs.rmSync(home, { recursive: true, force: true }))
  const bin = path.join(home, 'bin')
  fs.mkdirSync(bin)
  fs.mkdirSync(path.join(home, '.config'))
  for (const name of browsers) {
    fs.writeFileSync(path.join(bin, name), '#!/bin/sh\nexit 0\n', { mode: 0o755 })
  }
  fs.writeFileSync(path.join(home, '.config', 'hermes-desktop-flags.conf'),
    '# comment\n\n  --disable-vulkan  \n--flag=two words\n--literal=$(touch should-not-exist)\n')
  // A runtime of its own: the build container has no /usr/bin/hermes, whose
  // absence the launcher reports on stderr.
  const hermes = path.join(bin, 'hermes')
  fs.writeFileSync(hermes, '#!/bin/sh\nexit 0\n', { mode: 0o755 })
  const env = { HOME: home, PATH: bin, HERMES_DESKTOP_HERMES: hermes }
  // Replace only the final process launch, so tests exercise the real wrapper
  // without starting Electron or touching the user's home.
  const result = spawnSync('/bin/bash', ['-c', `
    exec() {
      /bin/bash -c 'printf "%s\\0" "\${AGENT_BROWSER_EXECUTABLE_PATH:-}" "$@"' probe "$@"
    }
    ${launcher}
  `, 'hermes-desktop', 'hermes://test'], { env, cwd: home, encoding: 'utf8' })
  assert.equal(result.status, 0, result.stderr)
  return { bin, home, stderr: result.stderr, values: result.stdout.split('\0').slice(0, -1) }
}

test('package-managed launcher pins the hermes-agent CLI and leaves the agent tree sealed', t => {
  const home = fs.mkdtempSync(path.join(os.tmpdir(), 'hermes-launcher-hermes-'))
  t.after(() => fs.rmSync(home, { recursive: true, force: true }))
  fs.mkdirSync(path.join(home, '.config'))
  const result = spawnSync('/bin/bash', ['-c', `
    exec() {
      /bin/bash -c 'printf "%s\\0" "\${HERMES_DESKTOP_HERMES:-}" "\${HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME:-}" "\${HERMES_DESKTOP_HERMES_ROOT:-}"' probe
    }
    ${launcher}
  `, 'hermes-desktop'], { env: { HOME: home, PATH: '/usr/bin:/bin' }, cwd: home, encoding: 'utf8' })
  assert.equal(result.status, 0, result.stderr)
  const values = result.stdout.split('\0').slice(0, -1)
  assert.equal(values[0], '/usr/bin/hermes')
  assert.equal(values[1], '1')
  assert.equal(values[2], '')
})

test('the launcher exports no browser, even with browsers on PATH', t => {
  const result = runLauncher(t, ['google-chrome-stable', 'google-chrome', 'chromium'])
  assert.equal(result.values[0], '')
  assert.equal(result.stderr, '')
})

test('without a browser the desktop launches without a hint', t => {
  const result = runLauncher(t)
  assert.equal(result.values[1], '/usr/bin/electron44')
  assert.equal(result.stderr, '')
})

test('the launcher keeps Electron flags and desktop arguments literal', t => {
  const result = runLauncher(t)
  assert.deepEqual(result.values.slice(1), [
    '/usr/bin/electron44', '--disable-vulkan', '--flag=two words',
    '--literal=$(touch should-not-exist)',
    '/usr/lib/hermes-agent-desktop/app.asar', 'hermes://test'
  ])
  assert.equal(fs.existsSync(path.join(result.home, 'should-not-exist')), false)
})

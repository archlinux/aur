const assert = require('node:assert/strict')
const fs = require('node:fs')
const os = require('node:os')
const path = require('node:path')
const { spawnSync } = require('node:child_process')
const { test } = require('node:test')

const launcher = fs.readFileSync(process.env.HERMES_LAUNCHER_PATH || path.join(__dirname, 'hermes-desktop'), 'utf8')

function runLauncher(t, browsers = [], override) {
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
  const env = { HOME: home, PATH: bin }
  if (override !== undefined) env.AGENT_BROWSER_EXECUTABLE_PATH = override
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

test('explicit browser path is not replaced by automatic detection', t => {
  const result = runLauncher(t, ['google-chrome-stable', 'chromium'], '/custom/browser with spaces')
  assert.equal(result.values[0], '/custom/browser with spaces')
})

test('Chrome stable is preferred to Chrome and Chromium', t => {
  const result = runLauncher(t, ['chromium', 'google-chrome', 'google-chrome-stable'])
  assert.equal(result.values[0], path.join(result.bin, 'google-chrome-stable'))
})

test('Chrome command is used when its stable alias is absent', t => {
  const result = runLauncher(t, ['chromium', 'google-chrome'])
  assert.equal(result.values[0], path.join(result.bin, 'google-chrome'))
})

test('Chromium is used when Chrome is absent', t => {
  const result = runLauncher(t, ['chromium'])
  assert.equal(result.values[0], path.join(result.bin, 'chromium'))
})

test('an empty override still allows browser detection', t => {
  const result = runLauncher(t, ['chromium'], '')
  assert.equal(result.values[0], path.join(result.bin, 'chromium'))
})

test('without a browser the desktop still launches and prints an install hint', t => {
  const result = runLauncher(t)
  assert.equal(result.values[0], '')
  assert.equal(result.values[1], '/usr/bin/electron42')
  assert.match(result.stderr, /chromium/i)
  assert.match(result.stderr, /AGENT_BROWSER_EXECUTABLE_PATH/)
})

test('browser selection preserves literal Electron flags and desktop arguments', t => {
  const result = runLauncher(t, ['chromium'])
  assert.deepEqual(result.values.slice(1), [
    '/usr/bin/electron42', '--disable-vulkan', '--flag=two words',
    '--literal=$(touch should-not-exist)',
    '/usr/lib/hermes-agent-desktop/app.asar', 'hermes://test'
  ])
  assert.equal(fs.existsSync(path.join(result.home, 'should-not-exist')), false)
})

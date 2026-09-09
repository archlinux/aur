const assert = require('node:assert/strict')
const fs = require('node:fs')
const os = require('node:os')
const path = require('node:path')
const { spawnSync } = require('node:child_process')
const { test } = require('node:test')

const installer = path.resolve(process.argv[2])

function fixture(t) {
  const home = fs.mkdtempSync(path.join(os.tmpdir(), 'hermes-package-test-'))
  t.after(() => fs.rmSync(home, { recursive: true, force: true }))
  const repo = path.join(home, 'origin')
  const root = path.join(home, 'agent')
  const resources = path.join(home, 'resources')
  const bin = path.join(home, 'bin')
  fs.mkdirSync(resources)
  fs.mkdirSync(bin)
  fs.writeFileSync(path.join(bin, 'ssh'), '#!/bin/sh\nexit 1\n', { mode: 0o755 })
  fs.copyFileSync(installer, path.join(resources, 'install.sh'))
  const env = {
    HOME: home, HERMES_HOME: home, PATH: `${bin}:/usr/bin:/bin`,
    HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME: '1',
    GIT_CONFIG_NOSYSTEM: '1', GIT_CONFIG_GLOBAL: '/dev/null',
    GIT_AUTHOR_NAME: 'Test', GIT_AUTHOR_EMAIL: 'test@example.invalid',
    GIT_COMMITTER_NAME: 'Test', GIT_COMMITTER_EMAIL: 'test@example.invalid'
  }
  function git(cwd, ...args) {
    const result = spawnSync('/usr/bin/git', args, { cwd, env, encoding: 'utf8' })
    assert.equal(result.status, 0, result.stderr)
    return result.stdout.trim()
  }
  git(home, 'init', '-q', '-b', 'main', repo)
  fs.writeFileSync(path.join(repo, 'policy.txt'), 'upstream\n')
  fs.writeFileSync(path.join(repo, 'version.txt'), 'one\n')
  git(repo, 'add', '.')
  git(repo, 'commit', '-qm', 'first')
  const first = git(repo, 'rev-parse', 'HEAD')
  fs.writeFileSync(path.join(repo, 'version.txt'), 'two\n')
  git(repo, 'commit', '-qam', 'second')
  const second = git(repo, 'rev-parse', 'HEAD')
  function policy(value = 'packaged') {
    fs.writeFileSync(path.join(resources, 'runtime-policy.patch'),
      `--- a/policy.txt\n+++ b/policy.txt\n@@ -1 +1 @@\n-upstream\n+${value}\n`)
  }
  policy()
  function install(commit = first) {
    return spawnSync('/bin/bash', ['-c', `
      source "$1" --manifest >/dev/null
      INSTALL_DIR="$2"
      REPO_URL_HTTPS="$3"
      INSTALL_COMMIT="$4"
      BRANCH=main
      clone_repo
      test "$PWD" = "$INSTALL_DIR"
    `, 'test', path.join(resources, 'install.sh'), root, repo, commit],
    { env, cwd: home, encoding: 'utf8', timeout: 15000 })
  }
  function succeeds(commit) {
    const result = install(commit)
    assert.equal(result.status, 0, result.stderr + result.stdout)
    assert.equal(git(root, 'rev-parse', 'HEAD'), commit)
  }
  function shell(body, extraEnv = {}) {
    return spawnSync('/bin/bash', ['-c', `source "$1" --manifest >/dev/null\nINSTALL_DIR="$2"\n${body}`,
      'test', path.join(resources, 'install.sh'), root], {
      env: { ...env, ...extraEnv }, cwd: home, encoding: 'utf8', timeout: 15000
    })
  }
  return { home, root, repo, resources, env, git, first, second, policy, install, succeeds, shell }
}

test('repository stage pins exact releases and preserves unrelated runtime files', t => {
  const f = fixture(t)
  f.succeeds(f.first)
  assert.equal(fs.readFileSync(path.join(f.root, 'policy.txt'), 'utf8'), 'packaged\n')
  fs.mkdirSync(path.join(f.root, 'venv'))
  fs.writeFileSync(path.join(f.root, 'venv', 'keep'), 'user environment')
  f.succeeds(f.first)
  f.succeeds(f.second)
  f.policy('new package policy')
  f.succeeds(f.second)
  assert.equal(fs.readFileSync(path.join(f.root, 'policy.txt'), 'utf8'), 'new package policy\n')
  f.succeeds(f.first)
  assert.equal(fs.readFileSync(path.join(f.root, 'version.txt'), 'utf8'), 'one\n')
  assert.equal(fs.readFileSync(path.join(f.root, 'venv', 'keep'), 'utf8'), 'user environment')
})

for (const ignored of [false, true]) {
  test(`repository upgrade preserves ${ignored ? 'ignored' : 'untracked'} files and restores its old patch`, t => {
    const f = fixture(t)
    f.succeeds(f.first)
    fs.writeFileSync(path.join(f.repo, 'local-data.txt'), 'upstream\n')
    f.git(f.repo, 'add', 'local-data.txt')
    f.git(f.repo, 'commit', '-qm', 'track new file')
    const next = f.git(f.repo, 'rev-parse', 'HEAD')
    if (ignored) fs.appendFileSync(path.join(f.root, '.git/info/exclude'), '\nlocal-data.txt\n')
    fs.writeFileSync(path.join(f.root, 'local-data.txt'), 'user data\n')
    const status = f.git(f.root, 'status', '--porcelain')
    assert.notEqual(f.install(next).status, 0)
    assert.equal(f.git(f.root, 'rev-parse', 'HEAD'), f.first)
    assert.equal(fs.readFileSync(path.join(f.root, 'local-data.txt'), 'utf8'), 'user data\n')
    assert.equal(fs.readFileSync(path.join(f.root, 'policy.txt'), 'utf8'), 'packaged\n')
    assert.equal(f.git(f.root, 'status', '--porcelain'), status)
  })
}

test('package bootstrap does not persist browser detection or rewrite explicit browser config', t => {
  const f = fixture(t)
  const envFile = path.join(f.home, '.env')
  const browser = path.join(f.home, 'chrome')
  fs.writeFileSync(browser, '#!/bin/sh\nexit 0\n', { mode: 0o755 })
  const detect = () => f.shell('configure_browser_env_from_system_browser', { AGENT_BROWSER_EXECUTABLE_PATH: browser })
  assert.equal(detect().status, 0)
  assert.equal(fs.existsSync(envFile), false)
  const explicit = 'AGENT_BROWSER_EXECUTABLE_PATH=/custom/browser\n'
  fs.writeFileSync(envFile, explicit)
  assert.equal(detect().status, 0)
  assert.equal(fs.readFileSync(envFile, 'utf8'), explicit)
})

test('package venv stage reuses a working interpreter and keeps installed files', t => {
  const f = fixture(t)
  f.succeeds(f.first)
  const venv = path.join(f.root, 'venv')
  const created = spawnSync('/usr/bin/python', ['-m', 'venv', '--without-pip', venv], { encoding: 'utf8' })
  assert.equal(created.status, 0, created.stderr)
  const version = spawnSync(path.join(venv, 'bin/python'), ['-c', 'import sys; print("%s.%s" % sys.version_info[:2])'], { encoding: 'utf8' }).stdout.trim()
  fs.writeFileSync(path.join(venv, 'keep'), 'installed extension')
  const result = f.shell('cd "$INSTALL_DIR"\nDISTRO=arch\nUV_CMD=/bin/false\nPYTHON_VERSION="$TEST_PYTHON_VERSION"\nsetup_venv', { TEST_PYTHON_VERSION: version })
  assert.equal(result.status, 0, result.stderr + result.stdout)
  assert.equal(fs.readFileSync(path.join(venv, 'keep'), 'utf8'), 'installed extension')
})

for (const state of ['wrong version', 'broken interpreter']) {
  test(`package venv stage rebuilds a ${state}`, t => {
    const f = fixture(t)
    f.succeeds(f.first)
    const venv = path.join(f.root, 'venv')
    fs.mkdirSync(path.join(venv, 'bin'), { recursive: true })
    fs.symlinkSync(state === 'wrong version' ? '/usr/bin/python' : '/bin/false', path.join(venv, 'bin/python'))
    fs.writeFileSync(path.join(venv, 'keep'), 'old environment')
    const uv = path.join(f.home, 'bin/uv')
    fs.writeFileSync(uv, '#!/bin/sh\nmkdir -p venv\ntouch venv/rebuilt\n', { mode: 0o755 })
    const result = f.shell('cd "$INSTALL_DIR"\nDISTRO=arch\nUV_CMD="$HOME/bin/uv"\nPYTHON_VERSION=3.0\nsetup_venv', { PYTHONOPTIMIZE: '1' })
    assert.equal(result.status, 0, result.stderr + result.stdout)
    assert.equal(fs.existsSync(path.join(venv, 'keep')), false)
    assert.equal(fs.existsSync(path.join(venv, 'rebuilt')), true)
  })
}

for (const mode of ['local browser', 'no browser', 'ordinary installer']) {
  test(`installer guidance: ${mode}`, t => {
    const f = fixture(t)
    f.succeeds(f.first)
    fs.writeFileSync(path.join(f.root, 'package.json'), '{}')
    const browser = path.join(f.home, 'chrome')
    fs.writeFileSync(browser, '#!/bin/sh\nexit 0\n', { mode: 0o755 })
    const result = f.shell(`
      HAS_NODE=true
      DISTRO=arch
      SKIP_BROWSER=true
      run_with_timeout() { test "$2" = npm; }
      install_node_deps
      print_success
    `, {
      HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME: mode === 'ordinary installer' ? '' : '1',
      AGENT_BROWSER_EXECUTABLE_PATH: mode === 'local browser' ? browser : ''
    })
    assert.equal(result.status, 0, result.stderr + result.stdout)
    if (mode === 'ordinary installer') {
      assert.match(result.stdout, /npx playwright install chromium/)
      assert.match(result.stdout, /hermes update/)
    } else {
      assert.doesNotMatch(result.stdout, /npx playwright install|hermes update|Browser tools will be unavailable|Browser engine setup complete/)
      assert.match(result.stdout, /AUR helper/)
      assert.match(result.stdout, mode === 'local browser' ? /Using local browser:/ : /Install Chrome or Chromium/)
    }
  })
}

for (const change of ['unstaged', 'staged', 'patch conflict', 'bad new patch']) {
  test(`package bootstrap preserves the checkout on ${change}`, t => {
    const f = fixture(t)
    f.succeeds(f.first)
    if (change === 'bad new patch') {
      fs.writeFileSync(path.join(f.resources, 'runtime-policy.patch'), 'not a patch\n')
    } else {
      const file = change === 'patch conflict' ? 'policy.txt' : 'version.txt'
      fs.writeFileSync(path.join(f.root, file), 'local edit\n')
      if (change === 'staged') f.git(f.root, 'add', file)
    }
    const before = ['policy.txt', 'version.txt'].map(file => fs.readFileSync(path.join(f.root, file), 'utf8'))
    const status = f.git(f.root, 'status', '--porcelain')
    assert.notEqual(f.install(f.second).status, 0)
    assert.equal(f.git(f.root, 'rev-parse', 'HEAD'), f.first)
    assert.deepEqual(['policy.txt', 'version.txt'].map(file => fs.readFileSync(path.join(f.root, file), 'utf8')), before)
    assert.equal(f.git(f.root, 'status', '--porcelain'), status)
  })
}

test('invalid pins and missing package patches fail before creating a checkout', t => {
  const f = fixture(t)
  assert.notEqual(f.install('not-a-commit').status, 0)
  assert.equal(fs.existsSync(f.root), false)
  fs.unlinkSync(path.join(f.resources, 'runtime-policy.patch'))
  assert.notEqual(f.install(f.first).status, 0)
  assert.equal(fs.existsSync(f.root), false)
})

test('the packaged backend uses system uv and refuses updates without a desktop environment flag', t => {
  const f = fixture(t)
  f.succeeds(f.first)
  fs.writeFileSync(path.join(f.home, 'bin', 'uv'), '#!/bin/sh\nexit 99\n', { mode: 0o755 })
  const env = { ...f.env, PYTHONPATH: path.resolve(process.argv[3]), TEST_ROOT: f.root }
  delete env.HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME
  const result = spawnSync('/usr/bin/python', ['-B', '-c', `
import os
from pathlib import Path
from hermes_cli import managed_uv
from hermes_cli.update_contract import evaluate_update_admission

managed_uv._PROJECT_ROOT = Path(os.environ['TEST_ROOT'])
assert managed_uv.resolve_uv() == '/usr/bin/uv'
assert str(managed_uv.ensure_uv()) == '/usr/bin/uv'
assert managed_uv.update_managed_uv(force=True) == '/usr/bin/uv'
refusal = evaluate_update_admission(Path(os.environ['TEST_ROOT']))
assert refusal is not None and refusal.code == 'package-managed'
assert 'hermes-agent-desktop' in refusal.update_command
  `], { env, cwd: f.home, encoding: 'utf8', timeout: 15000 })
  assert.equal(result.status, 0, result.stderr + result.stdout)
})

test('the packaged installer uses system uv even with an old private copy on PATH', t => {
  const f = fixture(t)
  fs.writeFileSync(path.join(f.home, 'bin', 'uv'), '#!/bin/sh\nexit 99\n', { mode: 0o755 })
  const result = spawnSync('/bin/bash', ['-c', `
    source "$1" --manifest >/dev/null
    DISTRO=arch
    install_uv
    test "$UV_CMD" = /usr/bin/uv
  `, 'test', installer], { env: f.env, cwd: f.home, encoding: 'utf8' })
  assert.equal(result.status, 0, result.stderr + result.stdout)
})

import { execFileSync } from 'node:child_process'
import { mkdirSync, readdirSync, rmSync, writeFileSync } from 'node:fs'
import { relative, resolve } from 'node:path'

const [srcdir] = process.argv.slice(2)
const src = resolve(srcdir)
const repo = resolve(src, 'deepseek-harness')
const manifestOf = tarball => JSON.parse(
  execFileSync('bsdtar', ['-xOf', tarball, 'package/package.json'], { encoding: 'utf8' }),
)

// Collect every workspace tarball packed by scripts/release/pack.ts.
const packages = new Map()
for (const dir of ['dist/aur-vendor', 'dist/aur-dsh']) {
  for (const file of readdirSync(resolve(repo, dir)).filter(file => file.endsWith('.tgz'))) {
    const full = resolve(repo, dir, file)
    const manifest = manifestOf(full)
    packages.set(manifest.name, { file: full, manifest })
  }
}

// Runtime closure of @deepseek-ai/dsh over the packed tarballs.
const seen = new Set()
function visit(name) {
  if (seen.has(name)) return
  const entry = packages.get(name)
  if (entry === undefined) return
  seen.add(name)
  for (const section of ['dependencies', 'peerDependencies']) {
    for (const dependency of Object.keys(entry.manifest[section] ?? {})) visit(dependency)
  }
}
visit('@deepseek-ai/dsh')
const tarballs = [...seen].sort().map(name => packages.get(name).file)
writeFileSync(resolve(src, 'runtime-tarballs.txt'), `${tarballs.join('\n')}\n`)

// Re-materialize the closure as a flat, packable node_modules via npm.
const npmRoot = resolve(src, 'npm-root')
rmSync(npmRoot, { recursive: true, force: true })
mkdirSync(npmRoot, { recursive: true })
const dependencies = {}
for (const tarball of tarballs) {
  const name = manifestOf(tarball).name
  dependencies[name] = `file:${relative(npmRoot, tarball).replaceAll('\\', '/')}`
}
const subprocessLocal = dependencies['@deepseek-ai/dsh-subprocess-local']
if (subprocessLocal === undefined) throw new Error('runtime closure is missing @deepseek-ai/dsh-subprocess-local')
writeFileSync(resolve(npmRoot, 'package.json'), `${JSON.stringify({
  name: 'deepseek-harness-aur-build',
  version: '0.0.0',
  private: true,
  dependencies,
  allowScripts: {
    [subprocessLocal]: true,
    koffi: true,
    'node-pty': true,
    '@google/genai': false,
    protobufjs: false,
    'node-addon-require-builtin': false,
  },
}, null, 2)}\n`)

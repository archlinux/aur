# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=0.0.0.beta.19500
pkgrel=1
pkgdesc='OpenCode beta - the AI coding agent for the terminal'
url='https://github.com/anomalyco/opencode'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'ripgrep')
provides=('opencode' 'opencode2')
conflicts=('opencode' 'opencode2')
options=('!strip' '!debug')
source=('LICENSE' 'opencode2')
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b' 'e3b78fc67cd2c837ce9cd48282fdeaffeeafd517dbc0fe1a654e821356e44701')
source_x86_64=('opencode-beta-0.0.0.beta.19500-x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-0.0.0-beta-19500.tgz')
sha256sums_x86_64=('1b2188c0cf00372599a23d599b079b4b809a665eb8b196eb6706af2a4d173dbd')
source_aarch64=('opencode-beta-0.0.0.beta.19500-aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-0.0.0-beta-19500.tgz')
sha256sums_aarch64=('134dd79fc303614cdabc6a936a5052fdef897f8e8295a9c13c5fd16ebabd7399')

package() {
  install -Dm755 "$srcdir/package/bin/opencode" "$pkgdir/usr/bin/opencode"
  install -Dm755 "$srcdir/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

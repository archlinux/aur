# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=0.0.0.beta.19289
pkgrel=1
pkgdesc='OpenCode V2 beta - the AI coding agent for the terminal'
url='https://github.com/anomalyco/opencode'
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'ripgrep')
provides=('opencode2')
conflicts=('opencode2')
options=('!strip' '!debug')
source=('LICENSE')
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
source_x86_64=('opencode-beta-0.0.0.beta.19289-x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-0.0.0-beta-19289.tgz')
sha256sums_x86_64=('ff91c05bd10d60082532cc0180ac9222ef11863c9d5fc7eacb1a0ea7797808d0')
source_aarch64=('opencode-beta-0.0.0.beta.19289-aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-0.0.0-beta-19289.tgz')
sha256sums_aarch64=('fb88aa02028505d5387788b060e095d55253706fa4d67add2beb55a3e1df54f3')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

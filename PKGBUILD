# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=0.0.0.beta.19365
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
source_x86_64=('opencode-beta-0.0.0.beta.19365-x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-0.0.0-beta-19365.tgz')
sha256sums_x86_64=('62d3aa70b059a288b254f6ff9dd51d95955a80a15082bf63bb0e7f7a9f689218')
source_aarch64=('opencode-beta-0.0.0.beta.19365-aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-0.0.0-beta-19365.tgz')
sha256sums_aarch64=('78c470dd514e7f26f72dd5a550b742e0cb9f7ee2e059e5b7fec068636d85b763')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

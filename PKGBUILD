# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=0.0.0.beta.19425
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
source_x86_64=('opencode-beta-0.0.0.beta.19425-x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-0.0.0-beta-19425.tgz')
sha256sums_x86_64=('8edd0ae1b752af44cec994e2033cbf2962d382cf463137f5d13ffca6000f4e37')
source_aarch64=('opencode-beta-0.0.0.beta.19425-aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-0.0.0-beta-19425.tgz')
sha256sums_aarch64=('6beb6765997fffedc5b2c7cc89759f54b9ce8f2cd52bed9c832ed7a0523696e9')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=0.0.0.beta.19271
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
source_x86_64=('opencode-beta-0.0.0.beta.19271-x86_64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-x64-baseline/-/cli-linux-x64-baseline-0.0.0-beta-19271.tgz')
sha256sums_x86_64=('0d0073742e8d53ff302befeb0a65e89fc9eb79289201664f6d99af6f77040eef')
source_aarch64=('opencode-beta-0.0.0.beta.19271-aarch64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-arm64/-/cli-linux-arm64-0.0.0-beta-19271.tgz')
sha256sums_aarch64=('007c956f0a35a418067e796ef611c0d749e83b4395e5b0e5171b2df30473759b')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=2.0.18
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
sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b' 'cd03022601e4848a957999a2a7b1c1ccf18b94f9a084a44719f62abaacebe83c')
source_x86_64=('opencode-beta-2.0.18-x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-2.0.18.tgz')
sha256sums_x86_64=('548b709efa8229f97c35f7cc6ba635425c407c5b3382a7435e92a80ce006cfcd')
source_aarch64=('opencode-beta-2.0.18-aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-2.0.18.tgz')
sha256sums_aarch64=('ddc98e5c789c496dada1ecfae9fe4e0931c7ac43a46da5436b97ecda5cd0ba5d')

package() {
  install -Dm755 "$srcdir/package/bin/opencode" "$pkgdir/usr/bin/opencode"
  install -Dm755 "$srcdir/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Dax <mail@thdxr.com>
pkgname=opencode-beta
pkgver=2.4.1
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
source_x86_64=('opencode-beta-2.4.1-x86_64.tgz::https://registry.npmjs.org/@opencode/cli-linux-x64-baseline/-/cli-linux-x64-baseline-2.4.1.tgz')
sha256sums_x86_64=('fd9714fb1a982f51f6185b5fb242706c31faf8b1d0cd633613df9156f565f7fa')
source_aarch64=('opencode-beta-2.4.1-aarch64.tgz::https://registry.npmjs.org/@opencode/cli-linux-arm64/-/cli-linux-arm64-2.4.1.tgz')
sha256sums_aarch64=('9eb4567ff0fab90b6dac106f786652a0ec15d65e25ffbcbb106e5ed1cee4f4e2')

package() {
  install -Dm755 "$srcdir/package/bin/opencode" "$pkgdir/usr/bin/opencode"
  install -Dm755 "$srcdir/opencode2" "$pkgdir/usr/bin/opencode2"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

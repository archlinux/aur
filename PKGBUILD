# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=hotkeyhub-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Bluetooth dual-boot key synchronization service (precompiled binary)"
arch=('x86_64')
url="https://github.com/meowrch/HotkeyHub"
license=('GPL-3.0')
depends=('dbus')
source=(
  "$url/releases/download/v$pkgver/hotkeyhub-linux-x86_64"
)
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
  # Install binary
  install -Dm755 hotkeyhub-linux-x86_64 "$pkgdir/usr/bin/hotkeyhub"
}

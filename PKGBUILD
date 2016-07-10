# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tty-no-cursor-blink
pkgver=0.0.2
pkgrel=1
pkgdesc="Disable blinking cursor in Linux tty"
arch=('any')
depends=('systemd')
url="https://github.com/atweiden/tty-no-cursor-blink"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('8ca08d05f57af72b4f850e642769f5406401b7ef2600c631431144104a4f0752')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 644 tty-no-cursor-blink.conf -t "$pkgdir/etc/tmpfiles.d"
}

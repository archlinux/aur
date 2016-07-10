# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tty-no-cursor-blink
pkgver=0.0.1
pkgrel=1
pkgdesc="Disable blinking cursor in Linux tty"
arch=('any')
depends=('systemd')
url="https://github.com/atweiden/tty-no-cursor-blink"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('76053e6ef875e80177ea06a03e30703b3b35e662425ebb9304dee7d9a46f9bac')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -Dm 644 tty-no-cursor-blink.service -t "$pkgdir/usr/lib/systemd/system"
}

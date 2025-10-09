# Maintainer: Arda Yılmaz <fijarom at fijarom dot com>

pkgname=thinkmorse
pkgver=1.1.0
pkgrel=1
pkgdesc="A Bash script for blinking the ThinkPad lid LED in Morse code"
arch=('x86_64')
url="https://sr.ht/~fijarom/thinkmorse/"
license=('GPL-3.0-or-later')
depends=('bash')

source=("git+https://git.sr.ht/~fijarom/thinkmorse")
sha256sums=('SKIP')

build() {
  :
}

package() {
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/$pkgname/systemd/aur/thinkmorse.service" "$pkgdir/usr/lib/systemd/system/thinkmorse.service"
  install -Dm644 "$srcdir/$pkgname/systemd/thinkmorse.timer" "$pkgdir/usr/lib/systemd/system/thinkmorse.timer"
}



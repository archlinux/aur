# Maintainer: Shantanu R <shantanu@ramanujapuram.com>

pkgname=rofi-firefox-profiles
pkgver=1.0.1
pkgrel=5
pkgdesc="Launch Firefox with a selected profile using rofi"
arch=('any')
url="https://github.com/shanten/rofi-firefox-profiles"
license=('MIT')
depends=('python' 'rofi' 'firefox')
source=(
  "$pkgname"
  "config.ini"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/config.ini" "$pkgdir/etc/$pkgname/config.ini"
}

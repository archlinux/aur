# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-tilix
pkgver=0.4.0
pkgrel=1
pkgdesc="Tempus themes for Tilix terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('tilix')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('23f7d83cc904df130ccdbd06ca2d89ae3ef2c417008f4e34d28776594420a3328cf1581241b787a2044338d6e18fbf1223fa94f3ff4c74a37e145e314835b79e')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/tilix/schemes"
  install -Dm 644 *.json \
    "$pkgdir/usr/share/tilix/schemes/"
}

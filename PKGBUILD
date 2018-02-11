# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-tilix
pkgver=0.2.0
pkgrel=1
pkgdesc="Tempus themes for Tilix terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('tilix')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('9de7fb8451500704fb6d27e546cc0cec05fac505b35e2943e8cf1b535b52ca6b9b7a8874c6c73b7ff42b593ab97e1dfcee547dd2cdee133aaf9b3016bb92bdc7')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/tilix/schemes"
  install -Dm 644 *.json \
    "$pkgdir/usr/share/tilix/schemes/"
}

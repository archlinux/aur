# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-tilix
pkgver=0.3.0
pkgrel=1
pkgdesc="Tempus themes for Tilix terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('tilix')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('83cf6b5b050601d7eda710db6c648183fa88c2e19aa1cd4dc8c1a79ed7ec4ca6f749ffe404c615e3c8bbc6cc4c987845a2a213072d321e2d952675b457df3420')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/tilix/schemes"
  install -Dm 644 *.json \
    "$pkgdir/usr/share/tilix/schemes/"
}

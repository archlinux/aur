# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-konsole
pkgver=0.2.0
pkgrel=1
pkgdesc="Tempus themes for KDE Konsole (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('konsole')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('33fadcca6400d129eca5a79a7aed70fa080c70010a8b10d6d1fd57ef8779ff2a98f00758a131fc2ca82c8e5d16c0d133cfd901b2720db1c1606c3e9bea5259b7')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/konsole"
  install -Dm 644 *.colorscheme \
    "$pkgdir/usr/share/konsole/"
}

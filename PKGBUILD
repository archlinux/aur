# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-xfce4-terminal
pkgver=0.3.1
pkgrel=1
pkgdesc="Tempus themes for Xfce4 terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('d6212a17281d8d3a813120a2e3e6612926b8fa74617aea1ae557a8daa52a277ffb77d4f96ed113e670a3d8fe9fbb00525c60948ccbfee39017b1a678eaae49b2')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm 644 *.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/"
}

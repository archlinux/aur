# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-xfce4-terminal
pkgver=0.3.0
pkgrel=1
pkgdesc="Tempus themes for Xfce4 terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('16a0663e20e58fcbe7504828ff256fa819f2fc3118e7b69d369235921c2344842edd72a212603ccd08a88d6c35bac9e6bd819cb5c9ea512ef81f52243e10926c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm 644 *.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/"
}

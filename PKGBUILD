# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-xfce4-terminal
pkgver=0.2.0
pkgrel=1
pkgdesc="Tempus themes for Xfce4 terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('3026e65c01feb63adb8c85eb6b8e7ef6c0679529b52ba097dc067a787900086dc178b0f203a448e251752cf828ee94dd9a654c99f3e7b6faf21bde147f5f350a')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm 644 *.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/"
}

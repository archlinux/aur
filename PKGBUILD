# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-konsole
pkgver=0.1.0
pkgrel=1
pkgdesc="Tempus themes for KDE Konsole (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('konsole')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('5c0181548c7955d86147ecde099d1d4f9e1e5c880161f50994b6554e4bc2551783a0ba054d7fb32347aee908cfc5bbcbef31c682d37981272d9c50db1d9d431d')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/konsole"
  install -Dm 644 *.colorscheme \
    "$pkgdir/usr/share/konsole/"
}

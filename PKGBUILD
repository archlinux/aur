# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=prot16-xfce4-terminal
pkgver=0.1.0
pkgrel=3
pkgdesc="Prot16 collection of themes for Xfce4 terminal"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('e43d10be5d2c016264df219286808f527f938a4fc9550c1b87ebb03ca6ca3d3a743ac1dd2dab86b5a14b9f982cbf761a425f5db7a182a7c13f5e3d9776652f18')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm 644 *.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/"
}

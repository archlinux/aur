# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-xfce4-terminal
pkgver=0.5.0
pkgrel=1
pkgdesc="Tempus themes for Xfce4 terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('c1b0b80426248aef7299f65491429c3c548111a9e7494975ff6bee7a5a5fd8143d8e5ad443bbec72c05c137c9d06e5b762ca7a6f7d98d4aa9c6523bd6b4a983a')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm 644 *.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/"
}

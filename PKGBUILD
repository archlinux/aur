# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=tempus-themes-xfce4-terminal
pkgver=0.4.0
pkgrel=1
pkgdesc="Tempus themes for Xfce4 terminal (minimum WCAG AA colour contrast compliance)"
arch=('any')
depends=('xfce4-terminal')
url="https://github.com/protesilaos/$pkgname"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('f6725bcca243574aad746e9976d9540e19ead0b4057db3db98eb4eaa5cd81f9e75959293acefff98e05a699a32a75019331fb0582b2da867d9a9e15a5212bdc9')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/xfce4/terminal/colorschemes"
  install -Dm 644 *.theme \
    "$pkgdir/usr/share/xfce4/terminal/colorschemes/"
}

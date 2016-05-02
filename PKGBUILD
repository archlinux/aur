# Author : zekeer <isoniasid@gmail.com>

pkgname=arc-dark-lxqt-manjaro
pkgver=1
pkgrel=1
pkgdesc="Arc-dark theme for lxqt panel"
url="https://manjaro.ru/"
license=("cc-by-nc-nd-4.0")
arch=(any)
source=("https://manjaro.ru/aur/arc-dark-lxqt-manjaro/$pkgname-$pkgver-$pkgrel.tar.gz")
md5sums=('c85427d791f849ce487746ed9908771c')

package(){
  mkdir -p $pkgdir/usr/share/lxqt/themes
  cp -a $srcdir/$pkgname $pkgdir/usr/share/lxqt/themes
}

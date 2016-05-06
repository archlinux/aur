# Author : zekeer <isoniasid@gmail.com>

pkgname=arc-dark-lxqt-manjaro
pkgver=1
pkgrel=6
pkgdesc="Arc-dark theme for lxqt panel"
url="https://manjaro.ru/"
license=("cc-by-nc-nd-4.0")
arch=(any)
source=("https://manjaro.ru/aur/arc-dark-lxqt-manjaro/$pkgname.tar.gz")
md5sums=('b60396c7dd3bf853e77da41f53b57cef')

package(){
  mkdir -p $pkgdir/usr/share/lxqt/themes/$pkgname
  cp -a $srcdir/$pkgname/* $pkgdir/usr/share/lxqt/themes/$pkgname
}

# Author : zekeer <isoniasid@gmail.com>

pkgname=arc-dark-lxqt-manjaro
pkgver=1
pkgrel=4
pkgdesc="Arc-dark theme for lxqt panel"
url="https://manjaro.ru/"
license=("cc-by-nc-nd-4.0")
arch=(any)
source=("https://manjaro.ru/aur/arc-dark-lxqt-manjaro/$pkgname.tar.gz")
md5sums=('d3151075468e10066fd0c532efe4538e')

package(){
  mkdir -p $pkgdir/usr/share/lxqt/themes/$pkgname
  cp -a $srcdir/$pkgname/* $pkgdir/usr/share/lxqt/themes/$pkgname
}

# Maintainer: Sandor Nagy <sandor dot nagy at kdemail dot net>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=qt4-doc
pkgver=4.8.7
pkgrel=1
pkgdesc="The Qt4 GUI toolkit documentation"
arch=('any')
url="http://qt-project.org/"
license=('LGPL2.1' 'GPL3')
depends=('qt4')
options=('docs')
_pkgfqn="qt-everywhere-opensource-src-$pkgver"
source=("https://download.qt.io/archive/qt/${pkgver%.*}/$pkgver/${_pkgfqn}.tar.gz")
md5sums=('d990ee66bf7ab0c785589776f35ba6ad')

package() {
  cd "$_pkgfqn"
  install -d -m 755 "$pkgdir"/usr/share/doc/qt4
  cp -r {demos,doc/*,examples} "$pkgdir"/usr/share/doc/qt4
}

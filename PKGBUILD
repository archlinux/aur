#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>

pkgname=kde-servicemenus-lprinter-qt
_basedir=kde-service-menu-lprinterqt
pkgver=0.5.3
pkgrel=2
pkgdesc="Print documents and more from dolphin with an interactive menu"
arch=('any')
url=('http://kde-look.org/content/show.php/lprinter-qt?content=111784')
license=('GPL3')
depends=('qt4' 'cups')
source=(http://peace-packages.googlecode.com/files/$_basedir.tar.gz)
install=lprinterqt.install
sha512sums=('6bb7f6ddb16f9f28ea7e819f7436ca7ef9921dde589e4e83ea3415c8ddf80a69f4b9f73a0bb763d04ca47fd7176cf42a92ffbc4a4bf2f4231798e8aa68de71fc')

package() {

cd $srcdir

mv $srcdir/$_basedir/usr $pkgdir/usr
}

# vim:set ts=2 sw=2 et:
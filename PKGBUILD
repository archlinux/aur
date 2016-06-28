# Maintainer: Michael Schubert <mschu.dev at google mail>
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
pkgname=jessyink
_pkgname=JessyInk
pkgver=1.5.6
pkgrel=1
pkgdesc="JavaScript that turns a layered Inkscape SVG image into a presentation"
url="http://code.google.com/p/jessyink/"
license=("GPL")
arch=('i686' 'x86_64')
depends=('inkscape' 'python-lxml')
makedepends=('unzip')
source=("http://jessyink.googlecode.com/files/$_pkgname-$pkgver.zip" )
noextract=($_pkgname-$pkgver.zip)
md5sums=('8cc06e004ede73f1fc94ed44f5193a64')

package() {
    mkdir -p "$pkgdir"/usr/share/inkscape/
    unzip -j -d "$pkgdir"/usr/share/inkscape/extensions/ $_pkgname-$pkgver.zip
}

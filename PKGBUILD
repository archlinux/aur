# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=tomboy-dragndrop
pkgver=0.1
pkgrel=1
pkgdesc="A tomboy plugin to create links between Tomboy notes via Drag-n-Drop"
url="https://sites.google.com/site/paginadisalvo/tools/tomboy-drag-n-drop"
depends=('tomboy')
arch=(any)
license=(LGPL)
source=("https://sites.google.com/site/paginadisalvo/tools/tomboy-drag-n-drop/DnDLinking.dll")
md5sums=('ea43bf3a412d7750918b75f3134c256e')

package() {
    install -Dm644 $srcdir/DnDLinking.dll $pkgdir/usr/lib/tomboy/addins/DnDLinking.dll
}
# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=tomboy-toc
pkgver=0.6
pkgrel=1
pkgdesc="A tomboy plugin to generate a Table of Contents menu item."
url="http://oluc.blogspot.com.ar/2011/04/tomboy-add-in-table-of-content.html"
depends=('tomboy')
arch=(any)
license=(LGPL)
source=("http://oluc.github.io/tomboy/bin/TableOfContent.dll-0.6")
md5sums=('460db27280e3991396c87789aeebf11c')

package() {
    install -Dm644 $srcdir/TableOfContent.dll-0.6 $pkgdir/usr/lib/tomboy/addins/TableOfContent.dll
}
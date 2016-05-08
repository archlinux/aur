# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=gtksourceview3-pkgbuild
pkgver=1
pkgrel=1
pkgdesc="PKGBUILD syntax highlight support in gtksourceview3 for Gedit 3 and others"
arch=(any)
license=('free')
depends=('gtksourceview3')
source=(pkgbuild.lang
        pkgbuild.xml)
md5sums=('d5b937ec089e7a2274f28fc1f6429af1'
         '1ebd783f76c5ae95d9a34fc91b50fbdd')

package() {
	install -Dm644 pkgbuild.xml "$pkgdir"/usr/share/mime/packages/pkgbuild.xml
	install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-3.0/language-specs/pkgbuild.lang
}

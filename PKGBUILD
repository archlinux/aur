# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgbase=gtksourceview-pkgbuild
pkgname=('mime-pkgbuild' 'gtksourceview2-pkgbuild' 'gtksourceview3-pkgbuild')
pkgver=3
pkgrel=1
arch=(any)
license=('free')
source=(pkgbuild.lang
        pkgbuild.xml)
md5sums=('8e826a434d0708951a2538270d21a8ff'
         '1ebd783f76c5ae95d9a34fc91b50fbdd')

package_mime-pkgbuild() {
   pkgdesc="MIME types for PKGBUILD files"
   depends=('shared-mime-info')

   install -Dm644 pkgbuild.xml "$pkgdir"/usr/share/mime/packages/pkgbuild.xml
}

package_gtksourceview2-pkgbuild() {
    pkgdesc="PKGBUILD syntax highlight support in gtksourceview2 for Mousepad and others"
    depends=('gtksourceview2' 'mime-pkgbuild')

    install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-2.0/language-specs/pkgbuild.lang
}

package_gtksourceview3-pkgbuild() {
    pkgdesc="PKGBUILD syntax highlight support in gtksourceview3 for Gedit 3 and others"
    depends=('gtksourceview3' 'mime-pkgbuild')

    install -Dm644 pkgbuild.lang "$pkgdir"/usr/share/gtksourceview-3.0/language-specs/pkgbuild.lang
}

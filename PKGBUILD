# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgbase=gtksourceview-pkgbuild
pkgname=('mime-pkgbuild' 'gtksourceview2-pkgbuild' 'gtksourceview3-pkgbuild')
pkgver=3
pkgrel=2
arch=(any)
license=('free')
source=($pkgbase-$pkgver.tar.gz)
md5sums=('5059e3401ab774955ee6fb2799ac4e2c')

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

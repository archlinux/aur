pkgname=kde-servicemenus-fileroller
pkgver=1
pkgrel=1
pkgdesc="File roller context menu entries for dolphin"
arch=('any')
license=('GPL')
depends=('dolphin' 'file-roller')
source=('filerollerextfolder.desktop' 'filerollerexthere.desktop')
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/kservices5/ServiceMenus/"    ${srcdir}/*.desktop
    install -Dm644 -t "${pkgdir}/usr/share/kde4/services/ServiceMenus/" ${srcdir}/*.desktop
}

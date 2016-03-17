# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-servicemenus-peazip
pkgver=20160317
pkgrel=1
pkgdesc="PeaZip archiver services, fixed for Dolphin KF5."
arch=('any')
url="http://peazip.org"
license=('GPL')
depends=('dolphin' 'peazip-qt-opensuse') ### NOTE: peazip-qt is corrupted and doesn't work at all, but version from openSUSE working fine.
source=('peazipadd.desktop' 'peazipext.desktop' 'peazipextfolder.desktop' 'peazipexthere.desktop' 'peazipopen.desktop')
sha256sums=('f7327d11418109548a62874dd72d03722db0450c5aaefd0f07dd336b1088d766'
            '6a7f7508b387c174efaafad21c1aa08a9f9b84c87975ca570bd1927249ded404'
            '78ca511279a11086b6dd2afaffa100102cf9938c7f9a405ab794eaaeb5cd0966'
            '20d6e009c210252f780a5db3b653c7e2529535937dbbe207c86a836d27e09890'
            'b6ea858353351b6ebdb8c2fbd5e2a558104214d0bb97c1584e609821569a8433')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/kservices5/ServiceMenus/"    ${srcdir}/*.desktop
    install -Dm644 -t "${pkgdir}/usr/share/kde4/services/ServiceMenus/" ${srcdir}/*.desktop
}

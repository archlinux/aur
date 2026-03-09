# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=ttf-paktype
pkgdesc='PakType fonts for Pakistani typography'
url='https://paktype.sourceforge.net/'
license=('custom')
pkgver='2026_02_27'
pkgver_=${pkgver//_/-}
pkgrel=1
arch=('any')
source=("https://master.dl.sourceforge.net/project/paktype/PakType-Release-${pkgver_}.zip")
sha256sums=('c74278d0e98d74b854897bafca6831f71a95421295ac70ba1e2009d8e2b2488b')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/License files/"*.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

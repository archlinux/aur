# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=ttf-paktype
pkgdesc='PakType fonts for Pakistani typography'
url='https://paktype.sourceforge.net/'
license=('custom')
pkgver='2022_04_01'
pkgver_=${pkgver//_/-}
pkgrel=1
arch=('any')
source=("https://master.dl.sourceforge.net/project/paktype/PakType-Release-${pkgver_}.zip")
sha256sums=('5398cfaf99296d866b4eaba45dd7b83374d3229ee7dee10b85fc93a2c9a06677')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/License files/"*.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

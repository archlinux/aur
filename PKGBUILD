# Maintainer: Pavel Khromov <pakhromov@gmail.com>
pkgname=shanns-liga-nerd-font
pkgver=1.0.0
pkgrel=1
pkgdesc="A combination of ComicShannsMono NF and SeriousShanns NF with ligatures from RecMonoSmCasual NF"
arch=('any')
url="https://github.com/pakhromov/ShannsLiga-Nerd-Font"
license=('MIT' 'OFL-1.1')
source=("${pkgname}-${pkgver}.zip::https://github.com/pakhromov/ShannsLiga-Nerd-Font/releases/download/v${pkgver}/ShannsLigaNerdFonts-v${pkgver}.zip")
sha256sums=('bacd8e87bf77230f28449137a9800e3265893cc1e81694be5a330bb3fa6377ef')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/OTF/${pkgname}"
    install -Dm644 *.otf "${pkgdir}/usr/share/fonts/OTF/${pkgname}/"
}

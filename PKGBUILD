# Maintainer: Renat Nasridinov <mavladi@gmail.com>

pkgname=otf-arsenal
pkgver=1.0
pkgrel=1
pkgdesc="Typesetting font with semi grotesque traditional Ukrainian forms"
arch=('any')
url="http://www.ukrtype.com/home/"
license=('custom:SIL Open Font License 1.1')
install=otf-arsenal.install
source=($pkgname.zip::http://www.ukrtype.com/arsenal_font.zip)
sha256sums=('2c6391dd23727b6730bf1cc96711bf0f36131fb4300d323f661a9bd21d5da47a')

build() {
  true
}

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 ${srcdir}/arsenal_font/*.otf "${pkgdir}/usr/share/fonts/OTF"
  cd ..
  install -D -m644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Amin Bandali <bandali@gnu.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=otf-alegreya
pkgver=2.008
pkgrel=1
pkgdesc='Serif family, part of the Alegreya "super family"'
arch=('any')
depends=('fontconfig')
url='https://www.huertatipografica.com/en/fonts/alegreya-ht-pro'
source=("https://github.com/huertatipografica/Alegreya/archive/v${pkgver}.tar.gz")
sha256sums=('44dacbe3c4b60c203b1d60f0a55ebf6c139823f83fd234f9b078ece7cb15676e')
conflicts=('otf-google-fonts-hg')
license=('custom:OFL')

package() {
  install -m644 -Dt "${pkgdir}/usr/share/fonts/OTF/" \
    "${srcdir}"/Alegreya-${pkgver}/fonts/otf/*.otf
  install -Dm644 \
    "${srcdir}/Alegreya-${pkgver}/OFL.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}

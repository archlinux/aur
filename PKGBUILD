# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# otfinfo --info *.ttf

pkgname='ttf-ecofont-sans'
pkgver=2.04
pkgrel=1
pkgdesc='Ecologically friendly sans font'
arch=('any')
url='http://www.ecofont.com'
_url_source='https://web.archive.org/web'
license=('custom')
# Use archive.org to download the free font; due to it no longer being avaliable for download on current ecofont.com website
source=("${pkgname}-${pkgver}-${pkgrel}.ttf::${_url_source}/20170302165133/${url}/assets/files/spranq_eco_sans_regular.ttf"
        "${pkgname}-${pkgver}-${pkgrel}-README.pdf::${_url_source}/20161011042213/${url}/assets/files/ecofontsans/EcofontSans-Example.pdf"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE.pdf::${_url_source}/20150801161738/${url/com/eu}:80/assets/files/Ecofont_licence.pdf")
sha256sums=('f73e3534e5af1145cc18de7f650e58884448cb5d2528300cd4d890616e0307a6'
            '11124bd45af31b2bfcfaaa030f2ab9d4d38d274b8bc100f209c04c8c53eef24c'
            '4b97091063d921c3766bdb81f3c3eaedea37815c222fdc5ef83d71cf896f8e2f')

package() {
  install -Dvm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/${pkgname}.ttf"
  install -Dvm644 "${pkgname}-${pkgver}-${pkgrel}-README.pdf"  "${pkgdir}/usr/share/doc/${_pkgname}/README.pdf"
  install -Dvm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE.pdf" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.pdf"
}

# vim: ts=2 sw=2 et:

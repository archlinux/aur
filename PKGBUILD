# Maintainer: Will Price <will.price94@gmail.com>

pkgname=vosviewer
pkgver=1.6.11
pkgrel=1
pkgdesc="Visualising scientific landscapes"
arch=('x86_64')
url="www.vosviewer.com"
license=('CUSTOM')
makedepends=()
depends=('java-runtime')
source=("vosviewer"
        "vosviewer_$pkgver.zip::http://www.vosviewer.com/download/f-13u2.zip")
sha512sums=('349d3ed36851a6d23548b7b327059786f02493c22fd14535924ae6b63154cef3718823039200cff7bfa7f339ce257b4ce7eaec670f3e93245aafb651ca428c07'
            '480ff2f8e3c76a939c53546d838a91374830146b9926c4c35229d318297d44c67671e02bf8f1b1a9c244eba0eb889c156db9f669855a4aefb0aeb9ac45ad10eb')

package() {
  mkdir -p "${pkgdir}/usr/"{bin,share/{"${pkgname}",doc/"${pkgname}"}}

  for file in VOSviewer.jar LICENSE.txt; do
    cp -a "${srcdir}/${file}" \
          "${pkgdir}/usr/share/${pkgname}"
  done
  cp -a "${srcdir}/Manual_VOSviewer_${pkgver}.pdf" \
        "${pkgdir}/usr/share/doc/${pkgname}/manual_vosviewer.pdf"
  install -m755 vosviewer "${pkgdir}/usr/bin/vosviewer"
}

# vim:set ts=2 sw=2 et:
sha512sums=('349d3ed36851a6d23548b7b327059786f02493c22fd14535924ae6b63154cef3718823039200cff7bfa7f339ce257b4ce7eaec670f3e93245aafb651ca428c07'
            '480ff2f8e3c76a939c53546d838a91374830146b9926c4c35229d318297d44c67671e02bf8f1b1a9c244eba0eb889c156db9f669855a4aefb0aeb9ac45ad10eb')
sha512sums=('349d3ed36851a6d23548b7b327059786f02493c22fd14535924ae6b63154cef3718823039200cff7bfa7f339ce257b4ce7eaec670f3e93245aafb651ca428c07'
            'c163dd89610042a9d2a677888100ff71b65018a3e7a899b617f5d7d5a3bda34dc8a83b2ad527e7cb37b97758e40b09f2829a76dfb778b2f79727401787e6753a')

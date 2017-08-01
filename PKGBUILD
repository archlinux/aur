# Maintainer: Uffe Jakobsen <_uffe_at_uffe_dot_org_>

pkgname=sigrok-firmware-fx2lafw-bin
_pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.5
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2 (precompiled binaries)"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
conflicts=("sigrok-firmware-fx2lafw")
makedepends=()
source=("http://sigrok.org/download/binary/${_pkgname}/${_pkgname}-bin-${pkgver}.tar.gz")
sha512sums=('39a5a49d51f92ce256503d0e682ae565249642d8479964327777e3795a20762ecd0fdeaee96c172e72143f5deb52d2cabb7cad4b5bf081c7576c2dfaa62b7b9e')


build(){
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/sigrok-firmware/"
  cp fx2lafw-*.fw "${pkgdir}/usr/share/sigrok-firmware/"
  #ln -s ${pkgdir}/usr/share/sigrok-firmware ${pkgdir}/usr/local/share/sigrok-firmware
  #ln -s /usr/local/share/sigrok-firmware $pkgdir/usr/share/sigrok-firmware
}

#
# EOF
#

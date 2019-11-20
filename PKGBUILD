# Maintainer: Uffe Jakobsen <_uffe_at_uffe_dot_org_>

pkgname=sigrok-firmware-fx2lafw-bin
_pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.7
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2 (precompiled binaries)"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
conflicts=("sigrok-firmware-fx2lafw")
makedepends=()
source=("http://sigrok.org/download/binary/${_pkgname}/${_pkgname}-bin-${pkgver}.tar.gz")
sha512sums=('60faac29198532bd5e03e44ed7f89c1502c83c6cf60ec5cc0f3ae9891c45b5de55eba5304c47d3231c8222ff61f1425aed88a44e7ff89d30b75d6e5faf7a623c')


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

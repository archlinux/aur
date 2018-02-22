# Maintainer: Uffe Jakobsen <_uffe_at_uffe_dot_org_>

pkgname=sigrok-firmware-fx2lafw-bin
_pkgname=sigrok-firmware-fx2lafw
pkgver=0.1.6
pkgrel=1
pkgdesc="An open-source firmware for Cypress FX2 (precompiled binaries)"
arch=(any)
url="http://sigrok.org/wiki/Fx2lafw"
license=(GPL2)
depends=()
conflicts=("sigrok-firmware-fx2lafw")
makedepends=()
source=("http://sigrok.org/download/binary/${_pkgname}/${_pkgname}-bin-${pkgver}.tar.gz")
sha512sums=('0dd4eb5327fbf5a8ee413b5ad460e2febe7da6aba13cfe4c7467966e4d4a0033b796ce7634647c0bbfa335034180272e7f8167b7a8181fb73ed3839891a44e46')


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

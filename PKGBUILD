#
# PKGBUILD: vcd
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
#

pkgname=vcd
pkgver=220120
pkgrel=1
pkgdesc="VCD file (Value Change Dump) command line viewer"
arch=('i686' 'x86_64')
url="https://github.com/yne/vcd"
license=('MIT')
depends=()
#
source=(
        https://github.com/yne/${pkgname}/archive/${pkgver}.tar.gz
       )

#
sha256sums=('74035b408c0fa646ebd94d61f8fc4f461cb331531936f4ae19b2343edd08cdd6')


#
prepare()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  #patch
}

#
build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

#
package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

#
# EOF
#

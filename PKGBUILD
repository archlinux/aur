#
# PKGBUILD: vcd
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
#

pkgname=vcd
pkgver=220213
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
sha256sums=('12b8691f96560de6528c47bd222dc638716405a3685366a49709f3a8fff2034c')


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

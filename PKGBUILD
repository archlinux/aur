#
# PKGBUILD: vcd
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
#

pkgname=vcd
pkgver=220121
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
sha256sums=('621b9d23283f40bc1da50018c8f3d8d3641b720d4f4dcc6dbf9f9131660c3fed')


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

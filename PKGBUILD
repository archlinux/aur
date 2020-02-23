#
# PKGBUILD: vcd
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
#

pkgname=vcd
pkgver=191029
pkgrel=1
pkgdesc="VCD file (Value Change Dump) command line viewer for Windows, Linux, OSX"
arch=('i686' 'x86_64')
url="https://github.com/yne/vcd"
license=('custom') # see LICENSE.txt
depends=()
#
source=(
        https://github.com/yne/${pkgname}/archive/${pkgver}.tar.gz
       )
#
md5sums=('3a60fa3212d5c93c76668fd162b0b223')

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
  cc -o vcd vcd.c
}

#
package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}"/usr/bin
  cp vcd "${pkgdir}"/usr/bin
}

#
# EOF
#

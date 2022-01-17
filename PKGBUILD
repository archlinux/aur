#
# PKGBUILD: vcd
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
#

pkgname=vcd
pkgver=211113
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
#md5sums=('90b917fc4d98010619321cb7e006d4ec')
sha256sums=('f4e6df3ef8a9f7dc10162ad7994d9dfcb64914df355e563fb70406ca4a838a19')


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
  mkdir -p "${pkgdir}/usr/bin"
  cp vcd "${pkgdir}/usr/bin"
}

#
# EOF
#

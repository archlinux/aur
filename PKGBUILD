#
# PKGBUILD: vcd
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
#

pkgname=vcd
pkgver=221217
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
sha256sums=('cfea0f5caef90067ff5fbbce533a2e26732d5a35ceb66d49ccfe999b6fbfac2f')


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

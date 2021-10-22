# Maintainer: Ward Segers <w@rdsegers.be>
pkgname=linmath
_pkgver=0538757
pkgver="2.${_pkgver}"
pkgrel=1
pkgdesc="lean linear math library, aimed at graphics programming"
arch=("any")
url="https://github.com/datenwolf/linmath.h"
license=('custom:WTFPL')
_pkgname="linmath.h"
provides=($_pkgname)
source=("git://github.com/datenwolf/${_pkgname}#commit=${_pkgver}")

md5sums=('SKIP')

package()
{
  install -Dm644 "${srcdir}/${_pkgname}/linmath.h" "${pkgdir}/usr/include/linmath.h"
  install -Dm644 "${srcdir}/${_pkgname}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}


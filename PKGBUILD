# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=cncnet
pkgver=1.0
_pkgver=1.0-1
pkgrel=1
pkgdesc="Command & Conquer Online - CnCNet"
arch=(any)
url="https://cncnet.org/"
licence=('')
group="games"
depends=('wine')
source=("${pkgname}_${pkgver}.tar.xz::https://downloads.cncnet.org/${pkgname}-${_pkgver}-any.pkg.tar.xz")
sha256sums=('ec900e3fd7642b7ec79cb9f073f93f63a160030c1b80504d1aef32b5aea85ea4')

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}

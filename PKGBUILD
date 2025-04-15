# Maintainer: John Patrick <john.patrick@gmail.com>
pkgname=neo-candy-icons
_pkgname=neo-candy-icons
pkgver=25.04
pkgrel=04
pkgdesc="Neo candy icons"
arch=('any')
url="https://github.com/erikdubois/${_pkgname}.git"
license=('GPL3')
makedepends=('git')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${_pkgname}::"git+${url}")
sha256sums=('SKIP')
package() {
	install -dm 755 ${pkgdir}/usr/share/icons/
    cp -r ${srcdir}/${_pkgname}/usr/share/icons/* ${pkgdir}/usr/share/icons/
}

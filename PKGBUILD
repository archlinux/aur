# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=openspin
_pkgname=OpenSpin
pkgver=1.00.78
pkgrel=1
pkgdesc="Open Source Spin interpreter for the Parallax Propeller"
arch=('x86_64' 'i686')
url="https://github.com/parallaxinc/OpenSpin"
license=('unknown')
groups=()
depends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("https://github.com/parallaxinc/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('773eac415d3adfdc1b909376ec3ecda3')


build()
{
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make
}

package()
{
	cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 755 build/openspin "${pkgdir}/usr/bin/openspin"
}

#
# EOF
#

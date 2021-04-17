# Maintainer: tabulatejarl8@gmail.com <TabulateJarl8>
# Maintainer: TurboWafflz <turbowafflz@gmail.com>
pkgname=iicalc-beta
pkgver=2.8.28
pkgrel=1
pkgdesc="An extensible calculator written in Python. Development/Beta Channel."
arch=('any')
url="https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator"
license=('GPL')
groups=('')
depends=('bash-completion' 'python-pip' 'dialog')
makedepends=("tar")
conflicts=("iicalc")
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("iicalc.tar.xz::https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator/-/jobs/artifacts/development/raw/iicalc.tar.xz?job=buildpkg")
sha512sums=('d65f31fe953bb0029061645db4731de6efe014cb577f9a3f18a0549b4d438b31a411229117da44f557df64191e635b951cfefbe41de0809ccd1f54bf65f0db1a')

package(){

	# Extract package data
	sed -i -E 's/debian/aur/' ${srcdir}/usr/share/iicalc/config.ini

	cp -r "${srcdir}/usr" "${pkgdir}/usr"
}

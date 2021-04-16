# Maintainer: tabulatejarl8@gmail.com <TabulateJarl8>
# Maintainer: TurboWafflz <turbowafflz@gmail.com>
pkgname=iicalc-beta
pkgver=2.8.25
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
sha512sums=('fe52264415b895e0a42ea511bc02375175af29ceaec2630caf08a8c3dde20f062f7735f213e9d7f85f2de2717fc30755e7fc01d1430bdf8da6474806886f6fe5')

package(){

	# Extract package data
	sed -i -E 's/debian/aur/' ${srcdir}/usr/share/iicalc/config.ini

	cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
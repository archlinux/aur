# Maintainer: tabulatejarl8@gmail.com <TabulateJarl8>
# Maintainer: TurboWafflz <turbowafflz@gmail.com>
pkgname=iicalc-beta
pkgver=2.8.27
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
sha512sums=('780d57f6c4b9e0780423f0c162c3f13159d925efd6ea1e1a7c9cb4b6b066d064a65bc99c4f46dc6c2583c3cb2f719dcddb2209f40fbe16fb680eee4fe9a5d08d')

package(){

	# Extract package data
	sed -i -E 's/debian/aur/' ${srcdir}/usr/share/iicalc/config.ini

	cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
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
sha512sums=('29c651c41f51fee071aa6c0c688ac60c4a00ec20b1dd72685a34903e5c734c9137195fa9c6ac64304e1a87c399377088a680bc4591b4f1fe5b40855ae816b384')

package(){

	# Extract package data
	sed -i -E 's/debian/aur/' ${srcdir}/usr/share/iicalc/config.ini

	cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
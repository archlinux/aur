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
sha512sums=('88679d591ba3d894042bddc670b483c61ecdb7805f6b2d95f186a2cfa9b03d5eaeec2c7314e3e4b3b37e5660aa2c1780efa1b532a70627d9fd82462bad1062a3')

package(){

	# Extract package data
	sed -i -E 's/debian/aur/' ${srcdir}/usr/share/iicalc/config.ini

	cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
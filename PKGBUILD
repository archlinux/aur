# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: 3Marz <omar490v@gmail.com>
pkgname=term3d
pkgver=1.0.8
pkgrel=1
epoch=
pkgdesc="3D Model viewer for the terminal"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/3Marz/term3d"
license=('MIT')
groups=()
depends=()
makedepends=(npm)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('SKIP')
validpgpkeys=()

build() {
	printf ""	
}
package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}

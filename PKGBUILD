# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname="lumi"
pkgver=0.9.4
pkgrel=1
pkgdesc="A Desktop App that offers a collection of tools to create, edit and share digital content with your class."
arch=('x86_64' 'aarch64')
url="https://${pkgname}.education"
_url="https://github.com/Lumieducation/Lumi"
license=('GPL3')
depends=('gtk3' 'nss' 'nodejs' 'alsa-lib')
#makedepends=('')
options=('!emptydirs')
source_x86_64=("${pkgname}-x86_64-${pkgver}.pacman::${_url}/releases/download/v${pkgver}/lumi-${pkgver}.pacman")
source_aarch64=("${pkgname}-aarch64-${pkgver}.pacman::${_url}/releases/download/v${pkgver}/lumi-${pkgver}-aarch64.pacman")
sha256sums_x86_64=('f0c1123ba6628e9c05ad3278e2eade31e262d05319fb523ce72a73b1d4d82e04')
sha256sums_aarch64=('a9294445b817d1fd2102959c48e500022079d8e56d599668871a82bfe6ce2ecd')

package() {
	install -d "${pkgdir}/{opt,usr}"
	cp -R "${srcdir}/opt/"  "${pkgdir}/opt/"
	cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="lumi"
pkgver="0.9.1"
pkgrel="1"
pkgdesc="A Desktop App that offers a collection of tools to create, edit and share digital content with your class."
arch=('x86_64')
url="https://${pkgname}.education"
_url="https://github.com/Lumieducation/Lumi"
license=('GPL3')
depends=('gtk3' 'nss' 'nodejs')
#makedepends=('')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.pacman::${_url}/releases/download/v${pkgver}/lumi-${pkgver}.pacman")
sha256sums=('cc259090478ae638089bf5d145783c92f8a3c0af55e05c8195bec10a6fbf4929')

package() {
	install -d "${pkgdir}/{opt,usr}"
	cp -R "${srcdir}/opt/"  "${pkgdir}/opt/"
	cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

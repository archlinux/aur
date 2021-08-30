# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="lumi"
pkgver="0.8.1"
pkgrel="1"
pkgdesc="A Desktop App that offers a collection of tools to create, edit and share digital content with your class."
arch=('x86_64')
url="https://${pkgname}.education"
_url="https://github.com/Lumieducation/Lumi"
license=('GPL3')
depends=('gtk3' 'nss' 'nodejs')
#makedepends=('')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.pacman::${_url}/releases/download/v0.8.1/lumi-0.8.1.pacman")
sha256sums=('144a7a603822061a3cf4f11fa7e622e94872c5c3cf3c376a9abf1730bee4cae6')

package() {
	install -d "${pkgdir}/{opt,usr}"
	cp -R "${srcdir}/opt/Lumi" "${pkgdir}/opt/"
	cp -R "${srcdir}/usr/share" "${pkgdir}/usr/"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

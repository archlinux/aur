# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="lumi"
pkgver="0.8.3"
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
sha256sums=('2c364198c259185736798305ab0f80e8d14bcb70d3ea0c17d3434c9d0d8c4b86')

package() {
	install -d "${pkgdir}/{opt,usr}"
	cp -R "${srcdir}/opt/Lumi" "${pkgdir}/opt/"
	cp -R "${srcdir}/usr/share" "${pkgdir}/usr/"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

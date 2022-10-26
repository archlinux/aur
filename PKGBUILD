# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: ValHue <vhuelamo at gmail dot com>

pkgname="lumi"
pkgver=0.10.0
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
sha256sums_x86_64=('8bed724013754a86b8b4ca952a08f6b3764753eb1935bb82eb0b5c8ba644c3e6')
sha256sums_aarch64=('1cc803ee1522ad9ecba5ada28274a839438d571ef24280befda3def0e9ff46fd')

package() {
	install -d "${pkgdir}/{opt,usr}"
	cp -R "${srcdir}/opt/"  "${pkgdir}/opt/"
	cp -R "${srcdir}/usr/" "${pkgdir}/usr/"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:

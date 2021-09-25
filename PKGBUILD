# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=mtplvcap-bin
_pkgname=mtplvcap
provides=('mtplvcap')
pkgver=1.4.1
pkgrel=1
license=('BSD')
pkgdesc="mtplvcap relays the Live View of Nikon cameras via WebSocket"
arch=('x86_64')
url="https://github.com/puhitaku/mtplvcap"
source=("https://github.com/puhitaku/mtplvcap/releases/download/v${pkgver}/mtplvcap_linux_amd64.zip")
sha256sums=('800ff2fda18632753e8efec285e63caa8a0cb4ed00a8252362c0463b5e876e21')

package() {
	install -Dm755 "${srcdir}"/mtplvcap_linux_amd64/$_pkgname "${pkgdir}"/usr/bin/$_pkgname
}

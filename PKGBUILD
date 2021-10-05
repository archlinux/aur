# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=mtplvcap-bin
_pkgname=mtplvcap
provides=('mtplvcap')
pkgver=1.4.2
pkgrel=1
license=('BSD')
pkgdesc="mtplvcap relays the Live View of Nikon cameras via WebSocket"
arch=('x86_64')
url="https://github.com/puhitaku/mtplvcap"
source=("https://github.com/puhitaku/mtplvcap/releases/download/v${pkgver}/mtplvcap_linux_amd64.zip")
sha256sums=('ef8794a9c8b48adeb5753448c71cfd3d542fbf7a94d8f1a3af7d9ad24338ff65')

package() {
	install -Dm755 "${srcdir}"/mtplvcap_linux_amd64/$_pkgname "${pkgdir}"/usr/bin/$_pkgname
}

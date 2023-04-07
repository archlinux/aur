# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=mtplvcap-bin
_pkgname=mtplvcap
provides=('mtplvcap')
pkgver=1.6.1
pkgrel=1
license=('BSD')
pkgdesc="mtplvcap relays the Live View of Nikon cameras via WebSocket"
arch=('x86_64')
url="https://github.com/puhitaku/mtplvcap"
source=("https://github.com/puhitaku/mtplvcap/releases/download/v${pkgver}/mtplvcap_linux_amd64.zip")
sha256sums=('4a6eca26cdad13a6fe31f5c087e9ced65c62a74534e379ba8c2c68cf1bbf8bb7')

package() {
	install -Dm755 "${srcdir}"/mtplvcap_linux_amd64/$_pkgname "${pkgdir}"/usr/bin/$_pkgname
}

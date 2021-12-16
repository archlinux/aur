# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=mtplvcap-bin
_pkgname=mtplvcap
provides=('mtplvcap')
pkgver=1.5.0
pkgrel=1
license=('BSD')
pkgdesc="mtplvcap relays the Live View of Nikon cameras via WebSocket"
arch=('x86_64')
url="https://github.com/puhitaku/mtplvcap"
source=("https://github.com/puhitaku/mtplvcap/releases/download/v${pkgver}/mtplvcap_linux_amd64.zip")
sha256sums=('cf52ff37e9f5008ab0c35138e7925f86b492d418fcd7f3f8ddab527454d1f9b8')

package() {
	install -Dm755 "${srcdir}"/mtplvcap_linux_amd64/$_pkgname "${pkgdir}"/usr/bin/$_pkgname
}

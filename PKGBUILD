# Maintainer: Jonas Gunz <arch at jonasgunz dot de>

pkgname=mtplvcap-bin
_pkgname=mtplvcap
provides=('mtplvcap')
pkgver=1.6.2
pkgrel=1
license=('BSD')
pkgdesc="mtplvcap relays the Live View of Nikon cameras via WebSocket"
arch=('x86_64')
url="https://github.com/puhitaku/mtplvcap"
source=("https://github.com/puhitaku/mtplvcap/releases/download/v${pkgver}/mtplvcap_linux_amd64.zip")
sha256sums=('0d3ba595a294ee506b8e7f26fd189107f648bd9be6a70b233d61595fb390d7ab')

package() {
	install -Dm755 "${srcdir}"/mtplvcap_linux_amd64/$_pkgname "${pkgdir}"/usr/bin/$_pkgname
}

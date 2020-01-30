pkgname=helmsman-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="Helmsman binary distribution"
arch=('x86_64')
url="https://github.com/Praqma/helmsman"
license=('MIT')
provides=('helmsman')
conflicts=('helmsman')
source=("https://github.com/Praqma/helmsman/releases/download/v${pkgver//_/-}/Helmsman_${pkgver//_/-}_linux_amd64.tar.gz"
        )
sha256sums=('206641e94741fc373f81bc38ebd6d196e6a4fca4c2aca6f0f2c5548da3ab08da')

package() {
	install -d "$pkgdir/usr/bin/"
	install -D helmsman "$pkgdir/usr/bin/"
}

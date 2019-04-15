pkgname=helmsman-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Helmsman binary distribution"
arch=('x86_64')
url="https://github.com/Praqma/helmsman"
license=('MIT')
provides=('helmsman')
conflicts=('helmsman')
source=("https://github.com/Praqma/helmsman/releases/download/v${pkgver//_/-}/Helmsman_${pkgver//_/-}_linux_amd64.tar.gz"
        )
sha256sums=('cbca53d0c4af702508d92d970d196ea5515291e4a63df6bdab425dd907a95e3f')

package() {
	install -d "$pkgdir/usr/bin/"
	install -D helmsman "$pkgdir/usr/bin/"
}

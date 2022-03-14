pkgname=helmsman-bin
pkgver=3.8.1
pkgrel=1
pkgdesc="Helmsman binary distribution"
arch=('x86_64')
url="https://github.com/Praqma/helmsman"
license=('MIT')
provides=('helmsman')
conflicts=('helmsman')
source=("https://github.com/Praqma/helmsman/releases/download/v${pkgver//_/-}/Helmsman_${pkgver//_/-}_linux_amd64.tar.gz"
        )
sha256sums=('cf9af3284fee9272827410c25ff651f7a4d7b6b5f67f87e509ce710d82ec757d')

package() {
	install -d "$pkgdir/usr/bin/"
	install -D helmsman "$pkgdir/usr/bin/"
}

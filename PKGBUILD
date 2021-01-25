pkgname=helmsman-bin
pkgver=3.6.3
pkgrel=1
pkgdesc="Helmsman binary distribution"
arch=('x86_64')
url="https://github.com/Praqma/helmsman"
license=('MIT')
provides=('helmsman')
conflicts=('helmsman')
source=("https://github.com/Praqma/helmsman/releases/download/v${pkgver//_/-}/Helmsman_${pkgver//_/-}_linux_amd64.tar.gz"
        )
sha256sums=('462e48fb7a39d95c5e6d385ac787f01f41786f5ef0e2f6fe1b6ffa739573e817')

package() {
	install -d "$pkgdir/usr/bin/"
	install -D helmsman "$pkgdir/usr/bin/"
}

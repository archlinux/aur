pkgname=helmsman-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Helmsman binary distribution"
arch=('x86_64')
url="https://github.com/Praqma/helmsman"
license=('MIT')
provides=('helmsman')
conflicts=('helmsman')
source=("https://github.com/Praqma/helmsman/releases/download/v${pkgver//_/-}/Helmsman_${pkgver//_/-}_linux_amd64.tar.gz"
        )
sha256sums=('0554bc6ba7d2a288ecf931a3e56958492371383df204872143d5fccba616b978')

package() {
	install -d "$pkgdir/usr/bin/"
	install -D helmsman "$pkgdir/usr/bin/"
}

pkgname=ipset-loader-git
pkgver=0.1
pkgrel=1
pkgdesc="ipset rule loader"
arch=(any)
license=(GPL3)
depends=(ipset zstd)
makedepends=(git)
provides=(ipset-loader)
conflicts=(ipset-loader)
source=("ipset-loader@.service" "ipset-loader")
sha512sums=(SKIP SKIP)

package() {
    install -Dm755 ipset-loader -t "$pkgdir"/usr/bin
    install -Dm644 ipset-loader@.service -t "$pkgdir"/usr/lib/systemd/system/
}


pkgname=dotflood
pkgver=1
pkgrel=1
pkgdesc='Tools for running Flood under a dedicated user'
arch=(any)
depends=(npm)
makedepends=()
optdepends=()
backup=()
source=(flood.service)
md5sums=(SKIP)

package() {
    install -Dm644 flood.service "${pkgdir}/usr/lib/systemd/user/flood.service"
}

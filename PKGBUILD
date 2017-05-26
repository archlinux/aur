pkgname=dotrtorrent
pkgver=1
pkgrel=1
pkgdesc='Tools for running rTorrent headless as a regular user'
arch=(any)
depends=(rtorrent dtach)
makedepends=()
optdepends=()
backup=()
source=(rtorrent.service)
md5sums=(SKIP)

package() {
    install -Dm644 rtorrent.service "${pkgdir}/usr/lib/systemd/user/rtorrent.service"
}

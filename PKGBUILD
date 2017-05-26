pkgname=dotcoredns
pkgver=1
pkgrel=1
pkgdesc='Tools for running CoreDNS as a regular user'
arch=(any)
depends=(coredns)
makedepends=()
optdepends=()
backup=()
source=(coredns.service)
md5sums=('b50821b897707b1832fccb44667f875f')

package() {
    install -Dm644 coredns.service "${pkgdir}/usr/lib/systemd/user/coredns.service"
}

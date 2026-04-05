pkgname=spxc-core
pkgver=1.5.1
pkgrel=2
pkgdesc="Core CLI for spxc: system info and versioning"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-core"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'procps-ng' 'curl' 'systemd')
provides=('spxc')
conflicts=('spxc')
source=("spxc")
sha256sums=('08a756b5be716bdfd2d3dbea4ac173b23fe070b20bcb1e76e2f8c344bcdb3901')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}

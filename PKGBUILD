pkgname=spxc-core
pkgver=1.6.8
pkgrel=2
pkgdesc="Core CLI for spxc: system info and versioning"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-core"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'procps-ng' 'curl' 'systemd')
provides=('spxc')
conflicts=('spxc')
source=("spxc")
sha256sums=('d48aec62fbd4e513aed5151cef6ea3bc9ad7be609bbde5b82d2d3d19158b1a1e')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}

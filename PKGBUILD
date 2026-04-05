pkgname=spxc-core
pkgver=1.7.0
pkgrel=1
pkgdesc="Core CLI for spxc: system info and versioning"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-core"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'procps-ng' 'curl' 'systemd')
provides=('spxc')
conflicts=('spxc')
source=("spxc")
sha256sums=('079dcb3220f389078293619347e53ac51fc0f3d7d19814a9c1fa6b66fc85e50b')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}

pkgname=spxc-core
pkgver=1.6
pkgrel=2
pkgdesc="Core CLI for spxc: system info and versioning"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-core"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'procps-ng' 'curl' 'systemd')
provides=('spxc')
conflicts=('spxc')
source=("spxc")
sha256sums=('53aa38955f0d90accf069d28952ebcbe2fbbc183ccb05b928f8a306e049fca27')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}

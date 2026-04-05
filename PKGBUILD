pkgname=spxc-core
pkgver=1.5
pkgrel=2
pkgdesc="Core CLI for spxc: system info and versioning"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-core"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'procps-ng' 'curl' 'inetutils' 'systemd')
provides=('spxc')
conflicts=('spxc')
source=("spxc")
sha256sums=('fb8be872ecda0c44365315897c88b02927289ca589b37a6b2892957597f8c081')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}

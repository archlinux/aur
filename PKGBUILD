pkgname=spxc-core
pkgver=1.6.9
pkgrel=2
pkgdesc="Core CLI for spxc: system info and versioning"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-core"
license=('MIT')
depends=('bash' 'util-linux' 'pciutils' 'procps-ng' 'curl' 'systemd')
provides=('spxc')
conflicts=('spxc')
source=("spxc")
sha256sums=('fda3779a125275cc43e145b8c6670207f5e80bd38d94ed4f24312d9bb8ca264a')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}

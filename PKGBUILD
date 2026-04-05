pkgname=spxc-core
pkgver=1.5
pkgrel=1
pkgdesc="Core CLI for spxc: system info and versioning"
arch=('any')
url="https://aur.archlinux.org/packages/spxc-core"
license=('MIT')
depends=('bash')
provides=('spxc')
conflicts=('spxc')
source=("spxc")
sha256sums=('5054013834c17013f1030d1e38fefbc22af1cd443287316c1a3c70920ff3b38a')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}

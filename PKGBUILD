# Maintainer: Gianni Ferrarotti <gianni.ferrarotti@gmail.com>
#
# AUR package for azadi — literate programming toolchain.
# Installs three binaries: azadi, azadi-macros, azadi-noweb.
#
# Update sha256sums after each release:
#   python packaging/update_pkgbuild.py <version>

pkgname=azadi-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="azadi — literate programming toolchain"
url="https://github.com/giannifer7/azadi"
license=('MIT' 'Apache-2.0')
arch=('x86_64')
provides=('azadi')
conflicts=('azadi' 'azadi-git')
depends=('gcc-libs' 'glibc')
options=('!debug')
source=("azadi-x86_64-linux.tar.gz::https://github.com/giannifer7/azadi/releases/download/v${pkgver}/azadi-x86_64-linux.tar.gz")
sha256sums=('4938bc8940d04b380cef7fad2e21fe22766871a41dc979e294e536d69278e844')

package() {
    install -Dm755 azadi        -t "${pkgdir}/usr/bin"
    install -Dm755 azadi-macros -t "${pkgdir}/usr/bin"
    install -Dm755 azadi-noweb  -t "${pkgdir}/usr/bin"
}

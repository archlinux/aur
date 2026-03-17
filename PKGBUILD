# Maintainer: Gianni Ferrarotti <gianni.ferrarotti@gmail.com>
#
# AUR package for azadi — literate programming toolchain.
# Installs the azadi binary. The separate azadi-macros and azadi-noweb
# binaries are available in the GitHub release for advanced pipeline use.
#
# Regenerate after each release:
#   python packaging/update_release.py <version>

pkgname=azadi-bin
pkgver=0.2.1
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
sha256sums=('bef01e9a36d93f4def9c2282a58d04fdcbf6d3168aa5b4a79092c574ea0c7f60')

package() {
    install -Dm755 azadi -t "${pkgdir}/usr/bin"
}

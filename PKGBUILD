# Maintainer: Gianni Ferrarotti <gianni.ferrarotti@gmail.com>
#
# AUR package for azadi — literate programming toolchain.
# Installs the azadi binary. The separate azadi-macros and azadi-noweb
# binaries are available in the GitHub release for advanced pipeline use.
#
# Regenerate after each release:
#   python packaging/update_release.py <version>

pkgname=azadi-bin
pkgver=0.3.5
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
sha256sums=('a627956c17e156e50c3d34474344acc8d89130ad5bbeb9f3f49a44378056ab70')

package() {
    install -Dm755 azadi -t "${pkgdir}/usr/bin"
}

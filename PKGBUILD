# Maintainer: Gianni Ferrarotti <gianni.ferrarotti@gmail.com>
#
# AUR package for azadi — literate programming toolchain.
# Installs the azadi binary. The separate azadi-macros and azadi-noweb
# binaries are available in the GitHub release for advanced pipeline use.
#
# Regenerate after each release:
#   python packaging/update_release.py <version>

pkgname=azadi-bin
pkgver=0.2.0
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
sha256sums=('494f3e0653a72a6dc6f0d8902f1a05162f32d575915366acc35934bff765a538')

package() {
    install -Dm755 azadi -t "${pkgdir}/usr/bin"
}

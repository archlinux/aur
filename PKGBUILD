# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=0.18.0
pkgrel=1
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('41e1d326106f97fda28dfa77dc1e6297c960d670d49214926431fb3ebbe0e39b')
b2sums_x86_64=('f608fb6aa77421193b395a592596b2c5ca0586222a340e357527ef42b8139cdd814b0fcfd426ab144ae970797f6be16293954e3afd51d61dbb3f2c3e6c1ec6c5')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}
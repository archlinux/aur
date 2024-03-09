# Maintainer: Jerry Y. Chen <chen@jyny.dev>

pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=0.19.2
pkgrel=1
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('ef6d60a425db613be74f2773419c665ce1ab3062d02a71a57a5a764e9ad0eb3c')
b2sums_x86_64=('e50b354b7af5e3779f36d049d757df2aeee3cd1bb23b05cb9552f28152a2c2f6da0bde277c11e3aeed65f1fdb322992e8cf501432dc828fc1a6e45bf44d88b9a')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}
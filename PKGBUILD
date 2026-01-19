# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Jerry Y. Chen <chen@jyny.dev>


pkgname=atlas-bin
pkgdesc="A modern tool for managing database schemas"
pkgver=1.0.0
pkgrel=3
binary=atlas
arch=("x86_64")
makedepends=("go")

license=("Apache-2.0")
provides=('atlas')
conflicts=('atlas')
url="https://github.com/ariga/${binary}"

source_x86_64=("https://release.ariga.io/atlas/${binary}-community-linux-amd64-v${pkgver}")

sha256sums_x86_64=('9933f9a75cad6962ba0cf39813ecc2b1454aa35e952e4bcc36ee714c921ac860')
b2sums_x86_64=('1f41c0a93de22d80d49ee620dc57da8c90bee3cf3bb4d81994cbdb4e01d23915e96c109d88e2196646f86aac42e242d019c21a909689637e00c2ded6ddef0a42')

package() {
    install -Dm755 "${srcdir}/${binary}-community-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/${binary}"
}

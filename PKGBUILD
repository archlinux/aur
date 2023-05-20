# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.16.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('4c0e256d1f1b77dce84a236b65af5bffa37de0aa8334eacc0ebd0bcc9d1a90dc411205095a9b28ed44bfaf7d12d3808a73ce49c7396238648c1d8032bc809511')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}

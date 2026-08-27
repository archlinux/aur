# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.29.0
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('69870fa845c28a70577f0a3e8fc2cae94ec73b84566ef15d564dd267ddeff66bbbddf2a414a234784a5156a733eae0177cab11d0fbf9cb9a072a6a9b834edbcd')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}

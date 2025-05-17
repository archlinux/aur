# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.22.4
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('31dfb17bab060718696e21cea62a2d366729573f5a41e64b81aff7e64d41f54b3a4b0919249d266d11c406e74d2e6cd7de5b2870408e1d84fd92aac6ae27fd40')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}

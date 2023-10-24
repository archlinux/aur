# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.18.2
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('d8f0e9e751fb95d9196508e0069b612a722a7447744a8b4dc55d31a691f762e665fbd8b2d68e91b6a8ae2d3310d8db261d3be4d2c0731304a9928aee3c306469')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}

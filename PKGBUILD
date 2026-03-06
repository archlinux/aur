# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.24.7
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('75eac18eb2b975b845051642dfbdf8656fa7d16f569f1b92b54c55d9b98a8557c43972db09b2f628615e291c7c254bc7a56dfb7428630b143ba92be12b757e3f')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}

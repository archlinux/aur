# Maintainer: Hao Long <aur@esd.cc>

pkgname=gosec-bin
pkgver=2.22.11
pkgrel=1
pkgdesc="Inspects source code for security problems by scanning the Go AST"
arch=("x86_64")
url="https://github.com/securego/gosec"
license=("Apache")
source=("https://github.com/securego/gosec/releases/download/v${pkgver}/gosec_${pkgver}_linux_amd64.tar.gz")
b2sums=('deb2e4e89122d63003832db8a2f4ba52251daafdc06fe6857dcdb516b208ceddfb955960b336bba3db064c4f131e3b213cbdad7c93e1ad15c492aee939ee09b0')

package() {
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 gosec ${pkgdir}/usr/bin/gosec
}

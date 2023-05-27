# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname=blahaj
pkgname=$_pkgname-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
provides=('blahaj')
conflicts=('blahaj' 'blahaj-git')
url="https://github.com/GeopJr/BLAHAJ"
arch=('x86_64')
license=('BSD-2-Clause')

source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64-static.zip")
sha256sums=('acc5b053846a0c85c4a4e55ad367596e4fecfac52663f3711df114ab0680eb1c')

package() {
    chmod +x blahaj
    chmod 755 blahaj
    install -D blahaj "${pkgdir}/usr/bin/blahaj"
}

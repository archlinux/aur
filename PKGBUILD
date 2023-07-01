# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname=blahaj
pkgname=$_pkgname-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
provides=('blahaj')
conflicts=('blahaj' 'blahaj-git')
url="https://github.com/GeopJr/BLAHAJ"
arch=('x86_64')
license=('BSD-2-Clause')

source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64-static.zip")
sha256sums=('e61b696f29af12d5a6f87549b06f2fbf256c0ac4c9a7c1093e3f47854e880f31')

package() {
    chmod +x blahaj
    chmod 755 blahaj
    install -D blahaj "${pkgdir}/usr/bin/blahaj"
}

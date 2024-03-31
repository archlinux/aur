# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname=blahaj
pkgname=$_pkgname-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool"
provides=('blahaj')
conflicts=('blahaj' 'blahaj-git')
url="https://github.com/GeopJr/BLAHAJ"
arch=('x86_64')
license=('BSD-2-Clause')

source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64-static.zip")
sha256sums=('3ed928347b16ab61069e1cb37cde446403c4601d4150135bdd700bce78b1b9ae')

package() {
    chmod +x blahaj
    chmod 755 blahaj
    install -D blahaj "${pkgdir}/usr/bin/blahaj"
}

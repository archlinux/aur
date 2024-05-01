# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>
_commit=c6cbfb19025e3be0c46f9f1d92f48ea3b68b7d65
pkgname=easyboot-bin
pkgver=1.0.0.rc6cbfb19
pkgrel=1
pkgdesc="Dependency-free, all-in-one boot manager and bootable disk image creator."
arch=("x86_64")
url="https://gitlab.com/bztsrc/${pkgname%-bin}"
license=("GPL-3.0-or-later")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/-/raw/$_commit/distrib/${pkgname%-bin}-$arch-linux.tgz")
b2sums=("29a65937a1530370715f206fe5d1cd355e831e3c20e195d1abd93cb2c515225c5c94c6bb964dc4acc289f8a39955bbd498af9d7fff62d9b015dcdb5f5d8efb8f")

pkgver() {
    echo "1.0.0.r${_commit::8}"
}

package() {
    mkdir $pkgdir/usr
    mv bin/ share/ $pkgdir/usr
}

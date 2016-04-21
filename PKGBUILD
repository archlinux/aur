# Maintainer: yubimusubi
pkgbase=bin2c
pkgname=('bin2c')
pkgver=1.1
pkgrel=1
pkgdesc="A command line tool to create C files from binary files."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/bin2c/"
license=('Public Domain')
sha256sums=('b2eef0a7ce77bb853b6496103727ce0614bfb69bc0f134813586ef12d6ae90e3')
makedepends=('gcc')

source=("$pkgbase::https://sourceforge.net/projects/bin2c/files/1.1/bin2c-1.1.zip/download")

build() {
    cd "$pkgbase"
    gcc -o bin2c bin2c.c
}

package() {
    cd "$pkgbase"

    mkdir -p $pkgdir/usr/bin
    mv bin2c $pkgdir/usr/bin
}

# Maintainer: Emil Sayahi <limesayahi@gmail.com>
pkgname=dokkoo-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Mokk (Macro Output Key Kit) implementation written in Rust."
url="https://github.com/MadeByEmil/dokkoo"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("dokkoo")
options=("strip")
source=("https://github.com/MadeByEmil/dokkoo/releases/download/v$pkgver/dokkoo-$pkgver-x86_64.tar.gz")
sha256sums=("ca4f7e03a0eaf8fd19ebb763383e18a5be75eec222ac81aecf6397c5685cf769")

package() {
    install -Dm755 dokkoo -t "$pkgdir/usr/bin/"
}

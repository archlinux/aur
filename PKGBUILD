# Maintainer: Emil Sayahi <limesayahi@gmail.com>
pkgname=dokkoo-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Mokk (Macro Output Key Kit) implementation written in Rust."
url="https://github.com/Dirout/dokkoo"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("dokkoo")
options=("strip")
source=("https://github.com/Dirout/dokkoo/releases/download/v$pkgver/dokkoo-$pkgver-x86_64.tar.gz")
sha256sums=("8ff0156f8b4c7b45858ae179fbab610fa88335613fc0d2378e22a5a31a44a909")

package() {
    install -Dm755 dokkoo -t "$pkgdir/usr/bin/"
}

# Maintainer: Emil Sayahi <limesayahi@gmail.com>
pkgname=dokkoo-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Mokk (Macro Output Key Kit) implementation written in Rust."
url="https://github.com/Dirout/dokkoo"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("dokkoo")
source=("https://github.com/Dirout/dokkoo/releases/download/v$pkgver/dokkoo-$pkgver-x86_64.tar.gz")
sha256sums=("44f55a360debc27ff0655c18049b5747d0e0b79369db4ec559931598f207596c")

package() {
    install -Dm755 dokkoo -t "$pkgdir/usr/bin/"
}

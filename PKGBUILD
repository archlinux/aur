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
sha256sums=("02cd1c0185d2fe38b0e2f5a35c078764e2c8745c06c4d860ea1101e0b82b58ad")

package() {
    install -Dm755 dokkoo -t "$pkgdir/usr/bin/"
}

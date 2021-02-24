# Maintainer: Emil Sayahi <limesayahi@gmail.com>
pkgname=dokkoo-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Mokk (Macro Output Key Kit) implementation written in Rust."
url="https://github.com/MadeByEmil/dokkoo"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("dokkoo")
options=("strip")
source=("https://github.com/MadeByEmil/dokkoo/releases/download/v$pkgver/dokkoo-$pkgver-x86_64.tar.gz")
sha256sums=("173a86a7ddcbb41461cd3473465a216d25eb08e2ae5dc4831dd27edd14284027")

package() {
    install -Dm755 dokkoo -t "$pkgdir/usr/bin/"
}

# Maintainer: Emil Sayahi <limesayahi@gmail.com>
pkgname=dokkoo-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Mokk (Macro Output Key Kit) implementation written in Rust."
url="https://github.com/MadeByEmil/dokkoo"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("dokkoo")
options=("strip")
source=("https://github.com/MadeByEmil/dokkoo/releases/download/v$pkgver/dokkoo-$pkgver-x86_64.tar.gz")
sha256sums=("94a3eb10a3e351d2be7cbd894b1e0385eabec99c07f2bbc0a5e6f3c35e3f58f9")

package() {
    install -Dm755 dokkoo -t "$pkgdir/usr/bin/"
}

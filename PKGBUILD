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
sha256sums=("09da70ee018bb21e5c97d74a664534a575eb5930febb4a226b398ee2e3901b42")

package() {
    install -Dm755 dokkoo -t "$pkgdir/usr/bin/"
}

# Maintainer: Maroš Grego <maros@grego.site>
pkgname=caretaker-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple, configurable filesystem watcher"
url="https://github.com/grego/caretaker"
license=("MIT")
arch=("x86_64")
provides=("caretaker")
options=("strip")
source=("https://github.com/grego/caretaker/releases/download/v$pkgver/caretaker-$pkgver-x86_64.tar.gz")
sha256sums=("7e3131060d3b8bf4f83039c0036d8ed2b83db888b9c3f7b4ea971196eb1b4479")

package() {
    install -Dm755 caretaker -t "$pkgdir/usr/bin/"
}

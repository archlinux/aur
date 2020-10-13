# Maintainer: Maroš Grego <maros@grego.site>
pkgname=caretaker-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple, configurable filesystem watcher"
url="https://github.com/grego/caretaker"
license=("MIT")
arch=("x86_64")
provides=("caretaker")
options=("strip")
source=("https://github.com/grego/caretaker/releases/download/v$pkgver/caretaker-$pkgver-x86_64.tar.gz")
sha256sums=("2a15e90542f48a6a570d11a38f6f4fb735b00a6cb3fa1b6ae22262fce1096e44")

package() {
    install -Dm755 caretaker -t "$pkgdir/usr/bin/"
}

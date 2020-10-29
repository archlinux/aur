# Maintainer: Maroš Grego <maros@grego.site>
pkgname=caretaker-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple, configurable filesystem watcher"
url="https://github.com/grego/caretaker"
license=("MIT")
arch=("x86_64")
provides=("caretaker")
options=("strip")
source=("https://github.com/grego/caretaker/releases/download/v$pkgver/caretaker-$pkgver-x86_64.tar.gz")
sha256sums=("e4c1cf05f965957593c9246fd367acafe2eb9b29ecc9028ca5238d15eb5f6160")

package() {
    install -Dm755 caretaker -t "$pkgdir/usr/bin/"
}

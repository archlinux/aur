# Maintainer: Maroš Grego <maros@grego.site>
pkgname=caretaker-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple, configurable filesystem watcher"
url="https://github.com/grego/caretaker"
license=("MIT")
arch=("x86_64")
provides=("caretaker")
options=("strip")
source=("https://github.com/grego/caretaker/releases/download/v$pkgver/caretaker-$pkgver-x86_64.tar.gz")
sha256sums=("1e8e9603495903bd9ab69bb553c96535dcb5b4532976cffc55fc89c2611c6378")

package() {
    install -Dm755 caretaker -t "$pkgdir/usr/bin/"
}

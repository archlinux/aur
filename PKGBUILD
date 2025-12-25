# Maintainer: everyoneexe <everyoneexe@example.com>
pkgname=quickshell-greetd
pkgver=1.0.0
pkgrel=1
pkgdesc="Use Quickshell lockscreen as greetd greeter"
arch=('any')
url="https://github.com/everyoneexe/quickshell-greetd"
license=('MIT')
depends=('quickshell' 'greetd' 'cage')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 launcher/quickshell-greetd-launcher "$pkgdir/usr/bin/quickshell-greetd-launcher"
    install -Dm644 examples/greeter.qml "$pkgdir/usr/share/quickshell-greetd/greeter.qml"
    install -Dm644 README.md "$pkgdir/usr/share/doc/quickshell-greetd/README.md"
}

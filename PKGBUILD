# Maintainer: Ariadna Ardere arxofari@proton.me
pkgname=openshock-tui-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A terminal UI for OpenShock written in Rust"
arch=('x86_64')
url="https://github.com/LostQuasar/openshock-tui"
license=('MIT')
source=("openshock-tui-x86_64-unknown-linux-gnu::https://github.com/LostQuasar/openshock-tui/releases/latest/download/openshock-tui-x86_64-unknown-linux-gnu")
sha256sums=('SKIP')
options=('!debug')
package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 openshock-tui-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/openshock-tui"
}

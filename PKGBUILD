# Maintainer: Ariadna Ardere arxofari@proton.me
pkgname=texoxide-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Zoxide but for text files"
arch=('x86_64')
url="https://github.com/Arxari/texoxide"
license=('GPL-3.0')
source=("https://github.com/Arxari/texoxide/releases/download/v1.0.2/texoxide-x86_64-unknown-linux-gnu")
sha256sums=('SKIP')
options=('!debug')
package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 texoxide-x86_64-unknown-linux-gnu "$pkgdir/usr/bin/texoxide"
}

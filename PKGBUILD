# Maintainer: CodeMyst <code@myst.rs>
pkgname=pastry
pkgver=1.0.0
pkgrel=1
pkgdesc="command line tool to paste files to https://paste.myst.rs/"
arch=("x86_64")
url="https://github.com/CodeMyst/pastry"
license=("MIT")
depends=("gcc-libs"
         "openssl")
source=("https://github.com/CodeMyst/pastry/releases/download/v1.0.0/pastry-linux-64.tar.gz")
sha256sums=('29d21b01d1b94dca25836953af8beb4c015d6203bb1d14c40f6712fe0797e8db')

package() {
    install -Dm755 "$srcdir/pastry" "$pkgdir/usr/bin/pastry"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/pastry/LICENSE"
}

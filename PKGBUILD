# Maintainer: AleX Grabowski <hurufu+aur@gmail.com>
pkgname=tuprolog-repl
pkgver=1.0.4
pkgrel=1
pkgdesc="A Kotlin Multi-Platform ecosystem for symbolic AI (REPL)"
arch=(any)
url='https://tuprolog.unibo.it'
license=(Apache-2.0)
depends=(java-runtime)
options=(!strip)
source=("https://github.com/tuProlog/2p-kt/releases/download/$pkgver/2p-repl-$pkgver-redist.jar")
sha256sums=('9b7055100b6f297247f8e57f648941ab1b85d9d97ce37f90bc05507af5893b3c')

package() {
    install -D --mode=644 -t "$pkgdir/usr/share/java/tuprolog" "$srcdir/2p-repl-$pkgver-redist.jar"
}

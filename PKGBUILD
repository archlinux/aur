# Maintainer: parazyd <parazyd AT dyne DOT org>
pkgname=notefy
pkgver=0.1
pkgrel=1
pkgdesc="Overly complicated CLI note keeper"
arch=('any')
url="https://github.com/parazyd/notefy"
license=('MIT')
depends=('bash')
optdepends=('srm')
source=("https://projectarch.tk/pub/mirror/notefy/$pkgname-$pkgver.tar.gz")
sha256sums=('a9393d47de4cd7594f6a88f2cf465f138fe46e0af4b0a6479fa591f94e2cfef2')

package() {
	cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/local/bin
	cp $srcdir/$pkgname-$pkgver/note $pkgdir/usr/local/bin/note
    chmod +x $pkgdir/usr/local/bin/note
}

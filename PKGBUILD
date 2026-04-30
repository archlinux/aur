# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=chess-cat-bin
_pkgname=chess-cat
pkgver=0.1.0
pkgrel=1
pkgdesc=' Visualize chess boards in your terminal'
arch=('x86_64')
url='https://github.com/ptsouchlos/chess-cat'
license=('MIT')
provides=('chess-cat')
conflicts=('chess-cat-git' 'chess-cat')
source=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('978baa316740d429666d44186330bd269040191bc4fea31cfe616a7a41efefbc')

package() {
    cd "$_pkgname-$pkgver-x86_64-unknown-linux-gnu"
    install -Dm0755 chess-cat "$pkgdir/usr/bin/chess-cat"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:

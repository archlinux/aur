# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql-bin
_pkgname="${pkgname%-bin}"
pkgver=0.6.0
pkgrel=1
pkgdesc='A modern PostgreSQL and MongoDB manager TUI - Binary build'
arch=('x86_64')
url='https://github.com/fcoury/tsql'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/fcoury/tsql/releases/download/v$pkgver/tsql-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fcoury/tsql/refs/tags/v$pkgver/LICENSE")
provides=('tsql')
conflicts=($_pkgname 'tsql-git')
sha256sums=('2e355fb6a6efa9b8901fdf9a6b53817ed715c9c230a9a7a2b90bfe63780de430'
            '279556e0ab3736896f0f313053d9a84b49743ae476a36a3724c31f1d7d853e20')

package() {
    # cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}

# vim: ts=4 sw=4 et:

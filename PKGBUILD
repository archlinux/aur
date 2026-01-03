# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="A modern PostgreSQL manager TUI"
arch=(x86_64)
url="https://github.com/fcoury/tsql"
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/fcoury/tsql/releases/download/v0.4.0/tsql-x86_64-unknown-linux-gnu.tar.gz")
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
sha256sums=('054d3272ff8b43b79944333c59f5e3028fc35340572c048a554518db56637ae6')

package() {
  # cd "$_pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
}


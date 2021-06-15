# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=yeet
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="A minimalistic pacman wrapper written in bash"
arch=('any')
url="https://github.com/gamemaker1/yeet"
license=('GPL3')
groups=()
depends=('git' 'package-query' 'pacman')
makedepends=()
optdepends=('ranger: for editing build files')
install=yeet.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/gamemaker1/yeet/archive/v$pkgver.tar.gz")
sha256sums=('c733fb0e0a693d8f47a04e81d8990b208fd3275fb8309cbb68ca7c208739759c')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/yeet" "$pkgdir/usr/bin/yeet"
	install -Dm644 "$srcdir/$pkgname-$pkgver/yeet.example.conf" "$pkgdir/usr/share/yeet/yeet.conf"
}
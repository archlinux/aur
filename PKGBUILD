# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=yeet
pkgver=0.4.0
pkgrel=3
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
sha256sums=('fdc43f90b309bf91bb2b18e8cd5457e15993d519a58efb49f6b3bf9bba6eefe6')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/source/yeet" "$pkgdir/usr/bin/yeet"
	install -Dm644 "$srcdir/$pkgname-$pkgver/assets/package/yeet.example.conf" "$pkgdir/usr/share/yeet/yeet.conf"
}

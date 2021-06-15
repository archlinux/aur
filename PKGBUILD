# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=yeet
pkgver=0.1.0
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
sha256sums=('ec8168fc6b54c7286575e18e05c9ec5f950c91a966158bab7c6699b043add15c')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/yeet" "$pkgdir/usr/bin/yeet"
	install -Dm644 "$srcdir/$pkgname-$pkgver/yeet.example.conf" "$pkgdir/usr/share/yeet/yeet.conf"
}
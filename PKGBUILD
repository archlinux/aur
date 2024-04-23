# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=yeet
pkgver=0.7.0
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
sha256sums=('7b20e87d8e91d7e4cca80826497a71eb1d0e8a5251f578c947e5ecfeaf372aa1')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/source/yeet" "$pkgdir/usr/bin/yeet"
	install -Dm644 "$srcdir/$pkgname-$pkgver/readme.md" "$pkgdir/usr/share/doc/yeet/readme.md"
	install -Dm644 "$srcdir/$pkgname-$pkgver/assets/package/yeet.8" "$pkgdir/usr/share/man/man8/yeet.8"
	install -Dm644 "$srcdir/$pkgname-$pkgver/assets/package/yeet.example.conf" "$pkgdir/usr/share/yeet/yeet.example.conf"
}

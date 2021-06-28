# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=yeet
pkgver=0.5.0
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
sha256sums=('20d8a04705563c7edf787a937cec18d99ac6aee1ffc26c53aa44070a5f1963a9')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/source/yeet" "$pkgdir/usr/bin/yeet"
	install -Dm644 "$srcdir/$pkgname-$pkgver/assets/package/yeet.8" "$pkgdir/usr/share/man/man8/yeet.8"
	install -Dm644 "$srcdir/$pkgname-$pkgver/assets/package/yeet.example.conf" "$pkgdir/usr/share/yeet/yeet.conf"
}

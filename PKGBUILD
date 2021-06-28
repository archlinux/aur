# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=bak
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="A backup tool for Linux/MacOS"
arch=('any')
url="https://github.com/gamemaker1/bak"
license=('GPL3')
groups=()
depends=('tar')
install=bak.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/gamemaker1/bak/archive/v$pkgver.tar.gz")
sha256sums=('3b518b42c13b284a14866eae29dcaef29088bd322b0305c006e99c555e34899c')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/bak" "$pkgdir/usr/bin/bak"
	install -Dm644 "$srcdir/$pkgname-$pkgver/bak.example.conf" "$pkgdir/usr/share/bak/bak.conf"
}
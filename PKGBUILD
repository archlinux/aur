# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=bak
pkgver=0.2.0
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
sha256sums=('15af95de9a1809f339398b4b11b5138b644d07170d04f5ccf3d9536b4864e54e')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/bak" "$pkgdir/usr/bin/bak"
	install -Dm644 "$srcdir/$pkgname-$pkgver/bak.example.conf" "$pkgdir/usr/share/bak/bak.conf"
}
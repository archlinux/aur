# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=bak
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="A backup tool written in bash"
arch=("any")
url="https://github.com/gamemaker1/bak"
license=("AGPL3")
depends=("bash" "coreutils" "tar" "zip" "unzip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gamemaker1/bak/archive/$pkgver.tar.gz")
sha256sums=('a2198a14bd73fab81e8072481c1ec1968e9b95dfa1f2a5fe5c1b2bd2affab5af')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/source/bak" "$pkgdir/usr/bin/bak"
	install -Dm644 "$srcdir/$pkgname-$pkgver/man/bak.1" "$pkgdir/usr/share/man/man1/bak.1"
	install -Dm644 "$srcdir/$pkgname-$pkgver/license.md" "$pkgdir/usr/share/licenses/bak/LICENSE"
}

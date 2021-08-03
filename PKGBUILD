# Maintainer: Vedant K (gamemaker1) <gamemaker0042 at gmail dot com>

pkgname=bak
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="A backup tool written in bash"
arch=("any")
url="https://github.com/gamemaker1/bak"
license=("AGPL3")
depends=("bash" "coreutils" "tar" "zip" "unzip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/gamemaker1/bak/archive/$pkgver.tar.gz")
sha256sums=('f4b73bb22c567907e71b89a8627eed9e5406f3e08848f09c0c53fc9a87419dc9')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/source/bak" "$pkgdir/usr/bin/bak"
	install -Dm644 "$srcdir/$pkgname-$pkgver/man/bak.1" "$pkgdir/usr/share/man/man1/bak.1"
	install -Dm644 "$srcdir/$pkgname-$pkgver/license.txt" "$pkgdir/usr/share/licenses/bak/LICENSE"
}

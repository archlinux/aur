# Maintainer: Paul Spruce <paul.spruce@gmail.com>
_pkgname=aquatone
pkgname=aquatone-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="A Tool for Domain Flyovers"
arch=(x86_64)
url="https://github.com/michenriksen/aquatone"
license=(MIT)
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=(chromium)
source=("$pkgname-$pkgver.zip::https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip")
b2sums=(SKIP)

package() {
	cd $srcdir
	install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

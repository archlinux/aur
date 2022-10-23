# Maintainer: Paul Spruce <paul.spruce@gmail.com>

_pkgname=aquatone
pkgname=aquatone-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="A Tool for Domain Flyovers"
arch=(x86_64)
url="https://github.com/michenriksen/aquatone"
license=(MIT)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(chromium)
source_x86_64=("$pkgname-$pkgver.zip::https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip")
b2sums_x86_64=("6f172117abd6ecad0d6e8901e81e61d0c8761a505c2bbf2fa8193ec27fb702a5df36cdfe40f5d6e32eca86bc571bef66bdee5fc1ce11e7085f50af4b40c29a51")

package() {
	install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

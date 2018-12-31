# Contributor: graysky <graysky AT archlinux dot us>

pkgname=auto-reencode
arch=('any')
license=('MIT')
pkgver=2.84
pkgrel=1
pkgdesc="Mass convert asf, flv, or wmv to mp4 contained x264 files using ffmpeg."
depends=('ffmpeg')
url="https://github.com/graysky2/auto-reencode"
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('49e73a8c99d7d4cf7beefcb051a3295693272e8834a1f9418f8b7fdd3989fc69')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Contributor: graysky <graysky AT archlinux dot us>

pkgname=auto-reencode
arch=('any')
license=('MIT')
pkgver=2.85
pkgrel=1
pkgdesc="Mass convert asf, flv, or wmv to mp4 contained x264 files using ffmpeg."
depends=('ffmpeg' 'mediainfo')
url="https://github.com/graysky2/auto-reencode"
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cac01409ff07f1f0837ffd0fabe29432084c60ca239e3ca488482028fedabd15')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

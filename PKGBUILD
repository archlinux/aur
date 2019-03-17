# Contributor: graysky <graysky AT archlinux dot us>

pkgname=auto-reencode
arch=('any')
license=('MIT')
pkgver=2.86
pkgrel=1
pkgdesc="Mass convert asf, flv, or wmv to mp4 contained x264 files using ffmpeg."
depends=('ffmpeg' 'mediainfo')
url="https://github.com/graysky2/auto-reencode"
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('86575ff5f2bc007c1f324c874ee1132037b69425ddc2675fa0eeeacbfe2a02ec')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

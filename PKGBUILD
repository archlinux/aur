# Contributor: graysky <graysky AT archlinux dot us>

pkgname=auto-reencode
arch=('any')
license=('MIT')
pkgver=2.83
pkgrel=1
pkgdesc="Mass convert asd, flv, or wmv to mp4 contained x264 files using ffmpeg."
conflicts=('autoflv2x264')
replaces=('autoflv2x264')
depends=('mediainfo>=0.7.2' 'ffmpeg')
url="https://github.com/graysky2/auto-reencode"
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7ac6d9422010035e27a368a488a2685addd14e9f7fe2d5a262a8f419ea54ca41')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

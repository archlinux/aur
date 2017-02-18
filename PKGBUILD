# Contributor: graysky <graysky AT archlinux dot us>

pkgname=auto-reencode
arch=('any')
license=('MIT')
pkgver=2.81
pkgrel=1
pkgdesc="Mass convert wmv and flv files to mp4 contained x264 files using ffmpeg."
conflicts=('autoflv2x264')
replaces=('autoflv2x264')
depends=('mediainfo>=0.7.2' 'ffmpeg')
url="https://github.com/graysky2/auto-reencode"
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('2cb5fddd5f6651f5f08f5b8561ac21c95e0fe3601454ae52cb287421b1dd051a')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

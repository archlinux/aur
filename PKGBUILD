# Contributor: graysky <graysky AT archlinux dot us>

pkgname=auto-reencode
arch=('any')
license=('MIT')
pkgver=2.82
pkgrel=1
pkgdesc="Mass convert wmv and flv files to mp4 contained x264 files using ffmpeg."
conflicts=('autoflv2x264')
replaces=('autoflv2x264')
depends=('mediainfo>=0.7.2' 'ffmpeg')
url="https://github.com/graysky2/auto-reencode"
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a064429a048e0e0e931a25afc26449035a7474eea013688f034a162242c1b030')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

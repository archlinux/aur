# Contributor: graysky <graysky AT archlinux dot us>

pkgname=auto-reencode
arch=('any')
license=('MIT')
pkgver=2.80
pkgrel=1
pkgdesc="Mass convert any format readable by handbrake to mp4 contained x264."
conflicts=('autoflv2x264')
replaces=('autoflv2x264')
depends=('mediainfo>=0.7.2' 'ffmpeg')
url="https://github.com/graysky2/auto-reencode"
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('54e13fc7e3bb26544ee66635024f46dee9274da3d69a7a6843a7d5372a3d12d9')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

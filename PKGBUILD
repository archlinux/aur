# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Karol Babioch <karol@babioch.de

pkgname=aaxtomp3
pkgver=1.2
pkgrel=1
pkgdesc="Convert Audible's .aax filetype to MP3, FLAC, M4A, or OPUS"
arch=('any')
url='https://github.com/KrumpetPirate/AAXtoMP3'
license=('custom:WTFPL')
depends=('ffmpeg' 'lame')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b2d6853f634fa63880f172a646da42556fb964c7921011cd1074055dd6a5da7e')

package() {
	cd "AAXtoMP3-$pkgver"
	install -Dm 755 AAXtoMP3 -t "$pkgdir/usr/bin/"
	install -Dm 755 interactiveAAXtoMP3 -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

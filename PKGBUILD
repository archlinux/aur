# Maintainer: Jake <aur@ja-ke.tech>
pkgname=nwjs-ffmpeg-codecs-bin
pkgver=0.50.3
pkgrel=1
pkgdesc="Additional proprietary codecs for nw.js from ffmpeg"
arch=('x86_64')
depends=('nwjs-bin')
url="https://github.com/iteufel/nwjs-ffmpeg-prebuilt"
license=('LGPL2.1')
source=("https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$pkgver/$pkgver-linux-x64.zip")
sha512sums=('4c653ea51a256735ea320dbf1831fd3281a73f479fe852b2ece4416a9c70d1dc8f18c29803ad1715400164790cae3106935775a4a8b0751400929abd7744df80')
install='codecs-preload.install'

package() {
	install -d "/opt/nwjs"
	install -D libffmpeg.so "$pkgdir/opt/nwjs/libffmpeg.so"
}

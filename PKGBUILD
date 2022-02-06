# Maintainer: Jake <aur@ja-ke.tech>
pkgname=nwjs-ffmpeg-codecs-bin
pkgver=0.60.0
pkgrel=1
pkgdesc="Additional proprietary codecs for nw.js from ffmpeg"
arch=('x86_64')
depends=('nwjs-bin')
url="https://github.com/iteufel/nwjs-ffmpeg-prebuilt"
license=('LGPL2.1')
source=("https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$pkgver/$pkgver-linux-x64.zip")
sha512sums=('ff18c4c61524193e63d50c4fb833001f9bf73267918ba092378c74b228f1dd96b8a662b3daca442da0efef879d2f2f8a036fea0df3b2eb9576a47b2070dce17b')
install='codecs-preload.install'

package() {
	install -d "/opt/nwjs"
	install -D libffmpeg.so "$pkgdir/opt/nwjs/libffmpeg.so"
}

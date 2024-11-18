# Maintainer: Jake <aur@ja-ke.tech>
pkgname=nwjs-ffmpeg-codecs-bin
pkgver=0.93.0
pkgrel=1
pkgdesc="Additional proprietary codecs for nw.js from ffmpeg"
arch=('x86_64')
depends=('nwjs-bin')
url="https://github.com/iteufel/nwjs-ffmpeg-prebuilt"
license=('LGPL2.1')
source=("https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$pkgver/$pkgver-linux-x64.zip")
sha512sums=('1908e134d7138c4415a554831a6a0bf2f217b44c6aedba4ac66e712abcceaa3e3873ed12962f4b18405b3f692b66ddcda85a0883477b4a228aa3ad773ea9eab4')
install='codecs-preload.install'

package() {
	install -d "/opt/nwjs"
	install -D libffmpeg.so "$pkgdir/opt/nwjs/libffmpeg.so"
}

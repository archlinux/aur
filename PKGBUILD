# Maintainer: Jake <aur@ja-ke.tech>
pkgname=nwjs-ffmpeg-codecs-bin
pkgver=0.77.0
pkgrel=1
pkgdesc="Additional proprietary codecs for nw.js from ffmpeg"
arch=('x86_64')
depends=('nwjs-bin')
url="https://github.com/iteufel/nwjs-ffmpeg-prebuilt"
license=('LGPL2.1')
source=("https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$pkgver/$pkgver-linux-x64.zip")
sha512sums=('fe449eebc7dfc14889b44c0678fef7bec888ffb8c3675465db9eb2f65ce6476746dbfc394c53b06848e6774bc0cd445daa81301607e2d17f33e099d807c71e99')
install='codecs-preload.install'

package() {
	install -d "/opt/nwjs"
	install -D libffmpeg.so "$pkgdir/opt/nwjs/libffmpeg.so"
}

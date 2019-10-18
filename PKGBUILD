# Maintainer: Jake <aur@ja-ke.tech>
pkgname=nwjs-ffmpeg-codecs-bin
pkgver=0.41.3
pkgrel=1
pkgdesc="Additional proprietary codecs for nw.js from ffmpeg"
arch=('x86_64')
depends=('nwjs-bin')
url="https://github.com/iteufel/nwjs-ffmpeg-prebuilt"
license=('LGPL2.1')
source=("https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$pkgver/$pkgver-linux-x64.zip")
sha512sums=('5e316b77bed924fa84f37563089c87b9f5ab48c86740b0efe72b04412a124565a9bc3ef3d6f5e22277efc6a6d0301fd875faae4b854e99f0403194add4c0a861')
install='codecs-preload.install'

package() {
	install -d "/opt/nwjs"
	install -D libffmpeg.so "$pkgdir/opt/nwjs/libffmpeg.so"
}

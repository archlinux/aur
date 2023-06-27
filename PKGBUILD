# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="vtracer-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc="Raster to Vector Graphics Converter"
url="https://www.visioncortex.org/vtracer/"
license=("MIT")
arch=("x86_64")
source=("vtracer-linux-$pkgver::https://github.com/visioncortex/vtracer/releases/download/$pkgver/vtracer-linux")
sha256sums=('781df157a5a886f141b11334a47882b72717d79cbe94670433d931f45c45cef1')
options=(!strip)

package(){
 install -D -m 755 "vtracer-linux-$pkgver" "$pkgdir/usr/bin/vtracer"
}

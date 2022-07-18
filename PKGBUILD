# Maintainer: xaque <xaque at 🦆 dot com>

pkgname=fire-vst3-bin
pkgver=0.9.9
pkgrel=1
pkgdesc="Fire is a multiband distortion / downsampler plugin developed by Wings"
arch=("x86_64")
url="https://github.com/jerryuhoo/Fire"
license=('AGPL')
depends=(brotli bzip2 freetype2 gcc-libs glib2 glibc graphite harfbuzz libpng pcre zlib)
_download_url="https://github.com/jerryuhoo/Fire/releases/download/"
source=("$pkgname-$pkgver.zip::${_download_url}/v${pkgver}/Fire-Linux.zip")
sha256sums=("3247a7d15a370d7f2b3c13cfb4e9a26573ae075f60f6ccf024f24f604c9fa16b")

package() {
	install -Dm755 "Fire-Linux/VST3/Fire.vst3/Contents/x86_64-linux/Fire.so" $pkgdir/usr/lib/vst3/Fire.vst3/Contents/x86_64-linux/Fire.so
}

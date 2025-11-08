# Maintainer: xaque <xaque at 🦆 dot com>

pkgname=fire-vst3-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Fire is a multiband distortion / downsampler plugin developed by Wings"
arch=("x86_64")
url="https://github.com/jerryuhoo/Fire"
license=('AGPL3')
depends=(brotli bzip2 freetype2 gcc-libs glib2 glibc graphite harfbuzz libpng pcre zlib)
_download_url="https://github.com/jerryuhoo/Fire/releases/download/"
source=("$pkgname-$pkgver.zip::${_download_url}/v${pkgver}/Fire-${pkgver}-Linux.zip")
sha256sums=("774b75bc213ebb1728aebee2f51d7ee371f3cfd0eb103b4fc7faff8efc43ab8a")

package() {
	install -Dm755 "VST3/Fire.vst3/Contents/x86_64-linux/Fire.so" $pkgdir/usr/lib/vst3/Fire.vst3/Contents/x86_64-linux/Fire.so
	install -Dm755 "VST3/Fire.vst3/Contents/Resources/moduleinfo.json" $pkgdir/usr/lib/vst3/Fire.vst3/Contents/Resources/moduleinfo.json
	install -Dm755 "CLAP/Fire.clap" $pkgdir/usr/lib/clap/Fire.clap
}

pkgbase=harrison-micro-glide
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=1.0.0.c01d1d08
pkgrel=3
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/micro-glide"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_MicroGlide_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('62ed9f5be4a55702c1eff3ac1fc0c357b334a55c3453663f0110787d01a72697')

package_harrison-micro-glide-vst-bin() {
	pkgdesc="Harrison Drum Flow (VST)"
	groups=('pro-audio' "vst-plugins")
	provides=("${pkgbase}-vst-bin")
	install -Dm755 "$srcdir/Harrison_MicroGlide/vst/Harrison_MicroGlide.so" "$pkgdir/usr/lib/vst/Harrison_MicroGlide.so"
}

package_harrison-micro-glide-vst3-bin() {
	pkgdesc="Harrison Drum Flow (VST3)"
	groups=('pro-audio' "vst3-plugins")
	install -Dm755 "$srcdir/Harrison_MicroGlide/vst3/Harrison_MicroGlide.vst3/Contents/x86_64-linux/Harrison_MicroGlide.so" "$pkgdir/usr/lib/vst3/Harrison_MicroGlide.vst3/Contents/x86_64-linux/Harrison_MicroGlide.so"
}

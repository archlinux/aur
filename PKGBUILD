pkgbase=harrison-32-bus
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=2.0.1.f8ffbf84
pkgrel=2
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/harrison-32-bus"
license=('EULA')
groups=('pro-audio')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_32Bus_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('083110dca505c1018b43f9324a07081d563d06e2f8deb1d643080f44424ffa60')

package_harrison-32-bus-vst-bin() {
	pkgdesc="Harrison 32 Bus Channel Strip (VST)"
	groups=('vst-plugins')
	conflicts=("harrison-32c-plugins-bin")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-32c-plugins-bin")
	install -Dm755 "$srcdir/Harrison_32Bus/vst/Harrison_32Bus.so" "$pkgdir/usr/lib/vst/Harrison_32Bus.so"
}

package_harrison-32-bus-vst3-bin() {
	pkgdesc="Harrison 32 Bus Channel Strip (VST3)"
	groups=('vst3-plugins')
	install -Dm755 "$srcdir/Harrison_32Bus/vst3/Harrison_32Bus.vst3/Contents/x86_64-linux/Harrison_32Bus.so" "$pkgdir/usr/lib/vst3/Harrison_32Bus.vst3/Contents/x86_64-linux/Harrison_32Bus.so"
}

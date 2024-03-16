pkgbase=harrison-bass-flow
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=3.0.1.3a9f39a4
pkgrel=3
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/bass-flow"
license=('EULA')
groups=()
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_BassFlow_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('fa3e1dc5d423c0ac59739b0f6638e31c835e8ac83e8dbc47aca572fc6efad774')

package_harrison-bass-flow-vst-bin() {
	pkgdesc="Harrison Bass Flow (VST)"
	groups=('pro-audio' "vst-plugins")
	conflicts=("harrison-ava-bf-vst" "harrison-ava")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-ava-bf-vst" "harrison-ava")
	install -Dm755 "$srcdir/Harrison_BassFlow/vst/Harrison_BassFlow.so" "$pkgdir/usr/lib/vst/Harrison_BassFlow.so"
}

package_harrison-bass-flow-vst3-bin() {
	pkgdesc="Harrison Bass Flow (VST3)"
	groupss=('pro-audio' "vst3-plugins")
	install -Dm755 "$srcdir/Harrison_BassFlow/vst3/Harrison_BassFlow.vst3/Contents/x86_64-linux/Harrison_BassFlow.so" "$pkgdir/usr/lib/vst3/Harrison_BassFlow.vst3/Contents/x86_64-linux/Harrison_BassFlow.so"
}

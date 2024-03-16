pkgbase=harrison-multiband-compressor
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=4.0.1.8ec4d54b
pkgrel=3
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/multiband-compressor"
license=('EULA')
groups=('pro-audio')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_MultiBandCompressor_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('bafa53170f5d20a2fcfe345b479f801f0a9c0bafbafe979a7556244d285c9a69')

package_harrison-multiband-compressor-vst-bin() {
	pkgdesc="Harrison MultiBand Compressor (VST)"
	groups=("vst-plugins")
	conflicts=("harrison-ava-mc-vst" "harrison-ava")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-ava-mc-vst" "harrison-ava")
	install -Dm755 "$srcdir/Harrison_MultiBandCompressor/vst/Harrison_MultiBandCompressor.so" "$pkgdir/usr/lib/vst/Harrison_MultiBandCompressor.so"
}

package_harrison-multiband-compressor-vst3-bin() {
	pkgdesc="Harrison MultiBand Compressor (VST3)"
	groups=("vst3-plugins")
	install -Dm755 "$srcdir/Harrison_MultiBandCompressor/vst3/Harrison_MultiBandCompressor.vst3/Contents/x86_64-linux/Harrison_MultiBandCompressor.so" "$pkgdir/usr/lib/vst3/Harrison_MultiBandCompressor.vst3/Contents/x86_64-linux/Harrison_MultiBandCompressor.so"
}

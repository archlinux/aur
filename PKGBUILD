pkgbase=harrison-legacy-eq
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=5.0.0.aacf6c6a
pkgrel=2
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/legacy-eq"
license=('EULA')
groups=('pro-audio')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_LegacyEQ_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('4e25fb8cf353c41336a5cfe82c69a3e245239cdf581c75cded28a10588634e12')

package_harrison-legacy-eq-vst-bin() {
	pkgdesc="Harrison Legacy EQ (VST)"
	groups=("vst-plugins")
	conflicts=("harrison-ava-legacyq-vst" "harrison-ava")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-ava-legacyq-vst" "harrison-ava")
	install -Dm755 "$srcdir/Harrison_LegacyEQ/vst/Harrison_LegacyEQ.so" "$pkgdir/usr/lib/vst/Harrison_LegacyEQ.so"
}

package_harrison-legacy-eq-vst3-bin() {
	pkgdesc="Harrison Legacy EQ (VST3)"
	install -Dm755 "$srcdir/Harrison_LegacyEQ/vst3/Harrison_LegacyEQ.vst3/Contents/x86_64-linux/Harrison_LegacyEQ.so" "$pkgdir/usr/lib/vst3/Harrison_LegacyEQ.vst3/Contents/x86_64-linux/Harrison_LegacyEQ.so"
}

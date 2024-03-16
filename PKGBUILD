pkgbase=harrison-mastering-eq
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=5.0.0.074d2374
pkgrel=2
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/mastering-eq"
license=('EULA')
groups=('pro-audio')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_MasteringEQ_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c88f281aa88bb3e9e146b1b381be58212d2bdbf02743a586328d0853bba688a7')

package_harrison-mastering-eq-vst-bin() {
	pkgdesc="Harrison Mastering EQ (VST)"
	groups=("vst-plugins")
	conflicts=("harrison-ava-me-vst" "harrison-ava")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-ava-me-vst" "harrison-ava")
	install -Dm755 "$srcdir/Harrison_MasteringEQ/vst/Harrison_MasteringEQ.so" "$pkgdir/usr/lib/vst/Harrison_MasteringEQ.so"
}

package_harrison-mastering-eq-vst3-bin() {
	pkgdesc="Harrison Mastering EQ (VST3)"
	install -Dm755 "$srcdir/Harrison_MasteringEQ/vst3/Harrison_MasteringEQ.vst3/Contents/x86_64-linux/Harrison_MasteringEQ.so" "$pkgdir/usr/lib/vst3/Harrison_MasteringEQ.vst3/Contents/x86_64-linux/Harrison_MasteringEQ.so"
}

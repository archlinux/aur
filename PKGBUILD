pkgbase=harrison-fastrack
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=2.0.1.a587504f
pkgrel=3
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/fastrack"
license=('EULA')
groups=()
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_FasTrack_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c7c3743671032d77902d5a652a4a4140dd00b0a617dc32eebed624934abf637e')

package_harrison-fastrack-vst-bin() {
	pkgdesc="Harrison Fastrack (VST)"
	groups=('pro-audio' "vst-plugins")
	provides=("${pkgbase}-vst-bin")
	install -Dm755 "$srcdir/Harrison_FasTrack/vst/Harrison_FasTrack.so" "$pkgdir/usr/lib/vst/Harrison_FasTrack.so"
}

package_harrison-fastrack-vst3-bin() {
	pkgdesc="Harrison Fastrack (VST3)"
	groups=('pro-audio' "vst3-plugins")
	install -Dm755 "$srcdir/Harrison_FasTrack/vst3/Harrison_FasTrack.vst3/Contents/x86_64-linux/Harrison_FasTrack.so" "$pkgdir/usr/lib/vst3/Harrison_FasTrack.vst3/Contents/x86_64-linux/Harrison_FasTrack.so"
}

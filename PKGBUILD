pkgbase=harrison-vocal-intensity-processor
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=2.0.0.39457821
pkgrel=3
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/vocal-intensity-processor"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_VocalIntensityProcessor_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('81da77d39f48936ddc255301afefbf8e33aed2ca1c96380c89e1cdf85481efcc')

package_harrison-vocal-intensity-processor-vst-bin() {
	pkgdesc="Harrison Vocal Intensity Processor (VST)"
	groups=('pro-audio' 'vst-plugins')
	conflicts=("harrison-32c-plugins-bin")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-32c-plugins-bin")
	install -Dm755 "$srcdir/Harrison_VocalIntensityProcessor/vst/Harrison_VocalIntensityProcessor.so" "$pkgdir/usr/lib/vst/Harrison_VocalIntensityProcessor.so"
}

package_harrison-vocal-intensity-processor-vst3-bin() {
	pkgdesc="Harrison Vocal Intensity Processor (VST3)"
	groups=('pro-audio' 'vst3-plugins')
	install -Dm755 "$srcdir/Harrison_VocalIntensityProcessor/vst3/Harrison_VocalIntensityProcessor.vst3/Contents/x86_64-linux/Harrison_VocalIntensityProcessor.so" "$pkgdir/usr/lib/vst3/Harrison_VocalIntensityProcessor.vst3/Contents/x86_64-linux/Harrison_VocalIntensityProcessor.so"
}

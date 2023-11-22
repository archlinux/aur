pkgbase=harrison-de-esser
pkgname=("${pkgbase}-vst-bin" "${pkgbase}-vst3-bin")
pkgver=5.0.0.1557034b
pkgrel=1
arch=('x86_64')
url="https://store.harrisonaudio.com/all-products/deesser"
license=('EULA')
groups=('pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("https://softwareupdate.solidstatelogic.com/DownloadManager/InstallersLinux/Harrison_De-Esser_v${pkgver}-linux-amd64.tar.gz")
sha256sums=('2b3fa17c148b6f9bb70ab75042890e0835a5782ba3d1e559db3cac5a38526963')

package_harrison-de-esser-vst-bin() {
	pkgdesc="Harrison De-Esser (VST)"
	groups=("vst-plugins")
	conflicts=("harrison-ava-ds-vst" "harrison-ava")
	provides=("${pkgbase}-vst-bin")
	replaces=("harrison-ava-ds-vst" "harrison-ava")
	install -Dm755 "$srcdir/Harrison_De-Esser/vst/Harrison_De-Esser.so" "$pkgdir/usr/lib/vst/Harrison_De-Esser.so"
}

package_harrison-de-esser-vst3-bin() {
	pkgdesc="Harrison De-Esser (VST3)"
	install -Dm755 "$srcdir/Harrison_De-Esser/vst3/Harrison_De-Esser.vst3/Contents/x86_64-linux/Harrison_De-Esser.so" "$pkgdir/usr/lib/vst3/Harrison_De-Esser.vst3/Contents/x86_64-linux/Harrison_De-Esser.so"
}

# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.60.0 # datasource=github-tags depName=facebook/pyrefly
pkgrel=1
pkgdesc='A faster Python type checker written in Rust'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://pyrefly.org/'
license=('MIT')

source_aarch64=("https://open-vsx.org/api/meta/pyrefly/linux-arm64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-arm64.vsix")
source_armv7h=("https://open-vsx.org/api/meta/pyrefly/linux-armhf/${pkgver}/file/meta.pyrefly-${pkgver}@linux-armhf.vsix")
source_x86_64=("https://open-vsx.org/api/meta/pyrefly/linux-x64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-x64.vsix")

sha256sums_aarch64=('820d0688223316893ebc4bdeecc2a6e56e1f8647b96b0a11b3983496f154e0b4')
sha256sums_armv7h=('d83011f9cc8cb35891c85a637c36ba1348c242455857a5b7b783706829d0fbf2')
sha256sums_x86_64=('c55bcfe0a3a3495be32b327d60f181b504a1a4688f9230234fbc3c73c98a5ff0')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

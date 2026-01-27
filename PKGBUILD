# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.50.0 # datasource=github-tags depName=facebook/pyrefly
pkgrel=1
pkgdesc='A faster Python type checker written in Rust'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://pyrefly.org/'
license=('MIT')

source_aarch64=("https://open-vsx.org/api/meta/pyrefly/linux-arm64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-arm64.vsix")
source_armv7h=("https://open-vsx.org/api/meta/pyrefly/linux-armhf/${pkgver}/file/meta.pyrefly-${pkgver}@linux-armhf.vsix")
source_x86_64=("https://open-vsx.org/api/meta/pyrefly/linux-x64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-x64.vsix")

sha256sums_aarch64=('e5d646eeb661167b29b8342d32593d5d30a0f6896e8d5479e0d5aa8096f9dd23')
sha256sums_armv7h=('a2a10ed04fdd9b8c2be0fb6c9b5c2726012a6e73624d36433996c69a5164583d')
sha256sums_x86_64=('19255ab34d6304bf36e88b72c8a9d6758280158ac8c08a0a04b7e57eef72f2ed')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

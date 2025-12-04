# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.44.1 # datasource=github-tags depName=facebook/pyrefly
pkgrel=1
pkgdesc='A faster Python type checker written in Rust'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://pyrefly.org/'
license=('MIT')

source_aarch64=("https://open-vsx.org/api/meta/pyrefly/linux-arm64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-arm64.vsix")
source_armv7h=("https://open-vsx.org/api/meta/pyrefly/linux-armhf/${pkgver}/file/meta.pyrefly-${pkgver}@linux-armhf.vsix")
source_x86_64=("https://open-vsx.org/api/meta/pyrefly/linux-x64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-x64.vsix")

sha256sums_aarch64=('4731ba55c884e5ed2c10d3c988386c82da2713aa91819137cde1da70fc28fae2')
sha256sums_armv7h=('2dd952c130f9a686b9ca9c2236f1e30f74fe64da423b07e504ef86d95a6d9109')
sha256sums_x86_64=('c80b2b9a1eeed2beb089d615d7f75fa087e6a85345034586978316727d4011bb')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=1.1.0 # datasource=github-tags depName=facebook/pyrefly
pkgrel=1
pkgdesc='A faster Python type checker written in Rust'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://pyrefly.org/'
license=('MIT')

source_aarch64=("https://open-vsx.org/api/meta/pyrefly/linux-arm64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-arm64.vsix")
source_armv7h=("https://open-vsx.org/api/meta/pyrefly/linux-armhf/${pkgver}/file/meta.pyrefly-${pkgver}@linux-armhf.vsix")
source_x86_64=("https://open-vsx.org/api/meta/pyrefly/linux-x64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-x64.vsix")

sha256sums_aarch64=('b60e2b244547f1eb96dd12cf6b9395592be9c894f1fbd1b40e9192d3e54b32a6')
sha256sums_armv7h=('28025a593b7c889c23071f0b1b744b883ce9c330859aada0830cb88f25f4e896')
sha256sums_x86_64=('dd88103bdc45718e5d4dd6021baebe5c7dfe84a8d5214c375e645e82b0c4d7bd')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

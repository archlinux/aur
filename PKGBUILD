# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=pyrefly-bin
pkgver=0.48.1 # datasource=github-tags depName=facebook/pyrefly
pkgrel=1
pkgdesc='A faster Python type checker written in Rust'
arch=('aarch64' 'armv7h' 'x86_64')
url='https://pyrefly.org/'
license=('MIT')

source_aarch64=("https://open-vsx.org/api/meta/pyrefly/linux-arm64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-arm64.vsix")
source_armv7h=("https://open-vsx.org/api/meta/pyrefly/linux-armhf/${pkgver}/file/meta.pyrefly-${pkgver}@linux-armhf.vsix")
source_x86_64=("https://open-vsx.org/api/meta/pyrefly/linux-x64/${pkgver}/file/meta.pyrefly-${pkgver}@linux-x64.vsix")

sha256sums_aarch64=('1a8554ee116b7cf9e5691251689420d01a8bb717bf627bd88c8ea6c15caaea00')
sha256sums_armv7h=('bb50b928d87c0da1f70c821b50d2a9ef4fc9bfc16fe6fcf397c5f6c0d72aa83a')
sha256sums_x86_64=('1dacd42be607e9511a7934d51b5b38883392da46ec1fa2bf7dc12fe1a9123c0f')

package() {

	cd "${srcdir}/extension"

	install -Dm755 "bin/pyrefly" "${pkgdir}/usr/bin/pyrefly"
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

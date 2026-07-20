# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=xtemplate-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A html/template-based hypertext preprocessor and rapid application development web server written in Go.'
arch=('x86_64' 'aarch64')
url="https://github.com/infogulch/xtemplate"
license=('Apache-2.0')
provides=('xtemplate')
conflicts=('xtemplate')
sha256sums_x86_64=('412feb85b18879077c944026ae0435dea2e9189fcea31bc3913e24a8506d6ed7')
sha256sums_aarch64=('8bba475144a242b7e599a112182c7e8831c2fc2b87b31df10959b92194ed6dc2')
source_x86_64=("${url}/releases/download/v${pkgver}/xtemplate-amd64-linux_v${pkgver}.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/xtemplate-arm64-linux_v${pkgver}.zip")
options=('!debug')

package() {
	install -Dm755 "${srcdir}/xtemplate" "${pkgdir}/usr/bin/xtemplate"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

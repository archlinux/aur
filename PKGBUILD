# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=xtemplate-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='A html/template-based hypertext preprocessor and rapid application development web server written in Go.'
arch=('x86_64' 'aarch64')
url="https://github.com/infogulch/xtemplate"
license=('Apache-2.0')
provides=("xtemplate=$pkgver")
conflicts=('xtemplate')
sha256sums_x86_64=('d717735437be0c7fec120f2ad1c9caaf18c2b1ef12e242b074dac63e0821bb99')
sha256sums_aarch64=('95761296785feaf51cf362ea3f6ab33478705d85fbace7e932df8be6d66036d9')
source_x86_64=("${url}/releases/download/v${pkgver}/xtemplate-amd64-linux_v${pkgver}.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/xtemplate-arm64-linux_v${pkgver}.zip")
options=('!debug')

package() {
	install -Dm755 "${srcdir}/xtemplate" "${pkgdir}/usr/bin/xtemplate"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

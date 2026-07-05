# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=xtemplate-bin
pkgver=0.9.6
pkgrel=1
pkgdesc='A html/template-based hypertext preprocessor and rapid application development web server written in Go.'
arch=('x86_64' 'aarch64')
url="https://github.com/infogulch/xtemplate"
license=('Apache-2.0')
provides=('xtemplate')
conflicts=('xtemplate')
sha256sums_x86_64=('27665bd60135aedf96f508df4e4b2316d27944e4e5ae9b96ebb8eb5aeef8baba')
sha256sums_aarch64=('13a3c9b61a083684f9ea6aa4a5f7d52a25e5058a5ca8ba095ae8f149b1a674e6')
source_x86_64=("${url}/releases/download/v${pkgver}/xtemplate-amd64-linux_v${pkgver}.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/xtemplate-arm64-linux_v${pkgver}.zip")
options=('!debug')

package() {
	install -Dm755 "${srcdir}/xtemplate" "${pkgdir}/usr/bin/xtemplate"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

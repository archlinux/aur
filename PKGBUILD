# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=xtemplate-bin
pkgver=0.9.5
pkgrel=1
pkgdesc='A html/template-based hypertext preprocessor and rapid application development web server written in Go.'
arch=('x86_64' 'aarch64')
url="https://github.com/infogulch/xtemplate"
license=('Apache-2.0')
provides=('xtemplate')
conflicts=('xtemplate')
sha256sums_x86_64=('42fa5a9831400c27544b4af9e183fdb7bac81603db66af2e41d21955dce64b90')
sha256sums_aarch64=('75b1b091fad790443f6ed44cb427d93826df276145032b45cb64a53fa52e597d')
source_x86_64=("${url}/releases/download/v${pkgver}/xtemplate-amd64-linux_v${pkgver}.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/xtemplate-arm64-linux_v${pkgver}.zip")
options=('!debug')

package() {
	install -Dm755 "${srcdir}/xtemplate" "${pkgdir}/usr/bin/xtemplate"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

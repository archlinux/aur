# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=ctop
pkgver=0.6.0
pkgrel=1
pkgdesc='Top-like interface for container metrics'
depends=('glibc')
arch=('x86_64')
url="https://ctop.sh/"
_url="https://github.com/bcicen/ctop"
url="https://ctop.sh/"
license=('MIT')
source=("${_url}/releases/download/v$pkgver/${pkgname}-$pkgver-linux-amd64"
        'LICENSE')
sha256sums=('061e728624efd9d5c6d591a75475d781c11e84da9482b6a9b3b6d5ec31df0442'
            'dddd1fa1661d597b20142203d85c29c01cf18d400be06db289b26d578f81c553')

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-linux-amd64" \
        "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:

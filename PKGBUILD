# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=ctop
pkgver=0.7.5
pkgrel=1
pkgdesc='Top-like interface for container metrics'
depends=('glibc')
arch=('x86_64')
url='https://ctop.sh/'
_url='https://github.com/bcicen/ctop'
license=('MIT')
source=("${_url}/releases/download/v$pkgver/${pkgname}-$pkgver-linux-amd64"
        'LICENSE')
sha256sums=('e2949316cdfe360374b76d45ea512f603b42c0db693a70a6a4c11624aa200b8c'
            'dddd1fa1661d597b20142203d85c29c01cf18d400be06db289b26d578f81c553')

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-linux-amd64" \
        "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=ctop
pkgver=0.6.1
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
sha256sums=('a0e5e3b5cc0bb1905b756a8b817a727f71ea8fe645aba54c7324491efa73f96f'
            'dddd1fa1661d597b20142203d85c29c01cf18d400be06db289b26d578f81c553')

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-linux-amd64" \
        "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:

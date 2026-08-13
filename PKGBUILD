# Maintainer: akirco earlfx@163.com
pkgname=pigma-bin
_pkgname=pigma
pkgver=0.2.8
pkgrel=1
pkgdesc="A netease cloud music client"
arch=('x86_64')
url="https://github.com/akirco/pigma"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Bertrand "Kamek" Bousquet <b.kamek@gmail.com>

pkgname=tftools-bin
_pkgname=${pkgname%-bin}
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI helper for working with TensorFlow"
depends=('tensorflow')
arch=('x86_64')
url="https://github.com/kamek-pf/tftools"
license=("MIT")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::${url}/releases/download/${pkgver}/${_pkgname}-${arch}-unknown-linux-gnu")
sha256sums=("08b146fc02e39de896ddbc92a97bb491977e87276802b3756dc88cc3830c4cf8")

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

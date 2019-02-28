# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=seriesmeta-bin
_pkgname=seriesmeta
pkgver=2.3.2
pkgrel=1
pkgdesc="Update the series metadata on a Kobo ereader"
arch=('x86_64')
url="https://geek1011.github.io/kepubify"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/geek1011/kepubify/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        https://raw.githubusercontent.com/geek1011/kepubify/v${pkgver}/LICENSE.md)
sha256sums=('d62e82e2507ed907cf5d9c60b49b528d548b2effac278639130541530f430127'
            'c3f90d57ebc94c7e2bb4c45a757d8f8cedbf06a0dd18161d31f0bd08d5a073b8')

package() {
    cd "${srcdir}/"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}

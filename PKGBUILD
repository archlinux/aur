# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=seriesmeta-bin
_pkgname=seriesmeta
pkgver=2.3.3
pkgrel=1
pkgdesc="Update the series metadata on a Kobo ereader"
arch=('x86_64')
url="https://geek1011.github.io/kepubify"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/geek1011/kepubify/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        https://raw.githubusercontent.com/geek1011/kepubify/v${pkgver}/LICENSE.md)
sha256sums=('a59d417f5821e29dae16c2801bcb955d1ea45da14a79b26a79710909ea380524'
            'c3f90d57ebc94c7e2bb4c45a757d8f8cedbf06a0dd18161d31f0bd08d5a073b8')

package() {
    cd "${srcdir}/"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}

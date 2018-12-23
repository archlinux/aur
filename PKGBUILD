# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=seriesmeta-bin
_pkgname=seriesmeta
pkgver=2.3.1
pkgrel=1
pkgdesc="Update the series metadata on a Kobo ereader"
arch=('x86_64')
url="https://geek1011.github.io/kepubify"
license=('MIT')
source=(${_pkgname}-${pkgver}::https://github.com/geek1011/kepubify/releases/download/v${pkgver}/${_pkgname}-linux-64bit
        LICENSE)
sha256sums=('ea2bed5262d63402c9f8541441ae3da2c605ec7a04ebfd0bcdc49bf5f8b154e2'
            'ebe9fd8caa3794012773f26556c2f40c19677d6f4142367ec5a1594c5bb793ad')

package() {
    cd "${srcdir}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}"/usr/bin/${_pkgname}
}

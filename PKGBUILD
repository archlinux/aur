# Maintainer: dcprevere
pkgname=isogeny-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='Template rendering and deployment CLI powered by Selmer'
arch=('x86_64')
url='https://github.com/dcprevere/isogeny'
license=('LicenseRef-proprietary')
provides=('isogeny')
conflicts=('isogeny')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/isogeny-linux-amd64")
sha256sums=('bdc959f8592e4056fcc3f2480c9fd55cde09fcc3f06a05c76712a385c8eb6b0d')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/isogeny"
}

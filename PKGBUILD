# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=shlink-web-client-bin
_pkgname=shlink-web-client
pkgver=4.9.1
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=("any")
url="https://github.com/shlinkio/shlink-web-client"
license=("MIT")
provides=('shlink-web-client')
conflicts=('shlink-web-client')
source=("https://github.com/shlinkio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_dist.zip")
b2sums=('77d0dba1f14f235a1028f584c0a7c35c861a2c388b192e2cfbbaec50df58abf3c05306a2c352e0097ed7ea76d8c6f7c124091f6226befc26bd2d71e693f5dc81')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cd "$srcdir/${_pkgname}_${pkgver}_dist/"
    cp -r * "${pkgdir}/usr/share/webapps/${_pkgname}"
}

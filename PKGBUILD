# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=shlink-web-client-bin
_pkgname=shlink-web-client
pkgver=4.9.0
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=("any")
url="https://github.com/shlinkio/shlink-web-client"
license=("MIT")
provides=('shlink-web-client')
conflicts=('shlink-web-client')
source=("https://github.com/shlinkio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_dist.zip")
b2sums=('a098164e1bfa72f1416a939401ed41c0c7f530af929dbb5f8f48692226f5930a3b1248cf22716be1f4657fcc36dcb98bb47cecb5c51b1101a03e78cc698644ac')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cd "$srcdir/${_pkgname}_${pkgver}_dist/"
    cp -r * "${pkgdir}/usr/share/webapps/${_pkgname}"
}

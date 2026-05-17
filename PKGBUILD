# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=shlink-web-client-bin
_pkgname=shlink-web-client
pkgver=4.7.1
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=("any")
url="https://github.com/shlinkio/shlink-web-client"
license=("MIT")
provides=('shlink-web-client')
conflicts=('shlink-web-client')
source=("https://github.com/shlinkio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_dist.zip")
sha256sums=('5fc24bc8bf213418509f2e6b811e9484f59967d341e95e7599f2f616f806e1ec')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cd "$srcdir/${_pkgname}_${pkgver}_dist/"
    cp -r * "${pkgdir}/usr/share/webapps/${_pkgname}"
}

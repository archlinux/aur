# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=shlink-web-client-bin
_pkgname=shlink-web-client
pkgver=4.8.1
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=("any")
url="https://github.com/shlinkio/shlink-web-client"
license=("MIT")
provides=('shlink-web-client')
conflicts=('shlink-web-client')
source=("https://github.com/shlinkio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_dist.zip")
b2sums=('d9f336f02809cd849d055aade21663f2f38e27d744b4cde38591fa01a32eede478b067e125a25c1500e2c8460d69c5c719ecda04f2758ad412165e59945d3791')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cd "$srcdir/${_pkgname}_${pkgver}_dist/"
    cp -r * "${pkgdir}/usr/share/webapps/${_pkgname}"
}

# Maintainer: Biggs <biggs at sergeantbiggs dot net>

pkgname=shlink-web-client-bin
_pkgname=shlink-web-client
pkgver=4.8.0
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=("any")
url="https://github.com/shlinkio/shlink-web-client"
license=("MIT")
provides=('shlink-web-client')
conflicts=('shlink-web-client')
source=("https://github.com/shlinkio/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_dist.zip")
b2sums=('7b95c4273c3aec4089ee8a5b2af0d9dd5cd365cc173f7616c0958e8b0ed7fe408c9e7acf999985ba37b95c1d2a463ebe1d08656b72c87a24aadda087b0d40cb0')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
    cd "$srcdir/${_pkgname}_${pkgver}_dist/"
    cp -r * "${pkgdir}/usr/share/webapps/${_pkgname}"
}

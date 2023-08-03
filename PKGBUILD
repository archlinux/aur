# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname=websocketd
pkgname=websocketd-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Like inetd, but for WebSockets. Turn any application that uses STDIO/STDOUT into a WebSocket server."
arch=('x86_64' 'i686' 'arm')
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/joewalnes/websocketd"
license=('BSD-2-Clause')
source_i686=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_386.zip")
source_x86_64=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_amd64.zip")
sha256sums_x86_64=('7f3d70598cb6596328ab4193419515e220696f3451f05b8173156d28c324a113')
sha256sums_i686=('563606e3465283114ab9e28bcdd2f48e12b237e4c1f5857cede5b9eb9be124f4')

package() {
    cd "${srcdir}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

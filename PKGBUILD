# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=websocketd
pkgver=0.2.10
pkgrel=1
pkgdesc="Like inetd, but for WebSockets. Turn any application that uses STDIO/STDOUT into a WebSocket server."
arch=('x86_64' 'i686' 'arm')
url="https://github.com/joewalnes/websocketd"
license=('BSD-2-Clause ')
depends=('glibc')

source_x86_64=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_amd64.zip")
md5sums_x86_64=('a8c7c05717419be68fcfbb6fe8f652f6')

source_i686=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_386.zip")
md5sums_i686=('1eec5c3471406a38aaa01c9f1708717e')

source_arm=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_arm.zip")
md5sums_arm=('61c653b9dbaf5cdb4813755973322789')

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

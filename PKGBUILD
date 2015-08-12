# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=websocketd
pkgver=0.2.11
pkgrel=1
pkgdesc="Like inetd, but for WebSockets. Turn any application that uses STDIO/STDOUT into a WebSocket server."
arch=('x86_64' 'i686' 'arm')
url="https://github.com/joewalnes/websocketd"
license=('BSD-2-Clause ')
depends=('glibc')

source_x86_64=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_amd64.zip")
md5sums_x86_64=('fa2db4feab033fb01630bcd90a1c1ca4')
md5sums_i686=('de34029d44ce5d8b51e1b4b027b868e1')
md5sums_arm=('abd72919f77a2ef4efd174e4e5c2944d')

source_i686=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_386.zip")

source_arm=("https://github.com/joewalnes/websocketd/releases/download/v${pkgver}/websocketd-${pkgver}-linux_arm.zip")

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('6aac64f17c1dd041b4036ebd489bb4735ef8f1aa7e65205de10f18b6ba323b1f')
sha256sums_x86_64=('9bfe3ad2edec200232618b64f7cb5548f39068774ecbcdca744271c543aaf90c')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

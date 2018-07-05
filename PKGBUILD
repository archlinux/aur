# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('any')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
sha256sums_x86_64=('e17e6624472d305900d8faf421e8417b24769be4ab4e046807e28b9f7ae7a3e9')
sha256sums_i686=('7d35b9a662cf5720334b86c97ee2c300c9e33bd4033005330107bcf34e114580')


package() {
    install -dm755 ${pkgdir}/usr/bin
        cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

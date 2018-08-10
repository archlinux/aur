# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.13.2
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
sha256sums_x86_64=('dda05438fd4620e6356d5b0206327577431bac358588317991a57857800aa24f')
sha256sums_i686=('a60e2b230fb92a5bf4e13dfc5be71ef3830e0f5faf67ae6ec36608de6871a431')


package() {
    install -dm755 ${pkgdir}/usr/bin
        cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

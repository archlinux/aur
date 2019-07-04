# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('d8e9716b723609e98b593c5b5e3c987165ea14b793b1e8d42d57a485ecb4add6')
sha256sums_x86_64=('b9203249d53f8a4db39c7cac822760ae39bb25952c043a0a873d64c61c0526d7')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

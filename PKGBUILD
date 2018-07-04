# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('any')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
sha256sums_x86_64=('a3957445583b4afc3a263f9b8a216625226c523a47a7db078446404ba5e73037')
sha256sums_i686=('503f5f64e172eab1367e86bd5d94e120c17ee94ac244460741555827c842f1d7')


package() {
    install -dm755 ${pkgdir}/usr/bin
        cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

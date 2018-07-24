# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('any')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
sha256sums_x86_64=('855bc38cbbbd86bcf48e86c77a430921374cb97a4e4799928af17e9fb2775154')
sha256sums_i686=('b330c1a0321884ef8775159204a3d0fae5425c315d29873187209f0acab8e720')


package() {
    install -dm755 ${pkgdir}/usr/bin
        cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

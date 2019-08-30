# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.27.1
pkgrel=2
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('e628640486ffd84224bfa152a1e4ff9c92f993600fd8e334bd3bca6cfd0398d2')
sha256sums_x86_64=('8c3bd53557e1415042ec3a8cbd0fac02740922f9c42babcc886a6e2f09fba09f')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

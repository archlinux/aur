# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.31.0
pkgrel=2
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('f2ba1e02f985293c394778156ae43844e22d473fe23682606794208b69352d8f')
sha256sums_x86_64=('2aa4bad2ef1f2b6dbeba96d54028873a029ee94e4cb41cb4e980108bab028745')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

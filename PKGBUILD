# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.16.2
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
sha256sums_x86_64=('865bfca587f06272ed3a325a517dc7e4dd6e004e968a59c21a32104d78805243')
sha256sums_i686=('ab97dfc0a5534ade982f9c7510e253cf2afb0f4c75555909828f86bfe15587da')


package() {
    install -dm755 ${pkgdir}/usr/bin
        cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

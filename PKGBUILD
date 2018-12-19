# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.16.4
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
sha256sums_i686=('7b40466c57c748479d8b09f56f0e2934d3580fcee630c884e0ed7f6af563098f')
sha256sums_x86_64=('4a5ac53ae7aa9e8351db37e78df60dec9541f38132413c19a3371f4add3b7e32')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

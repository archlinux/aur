# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.32.2
pkgrel=2
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('68b16f4f1d053fc0be39b97b85ba53a62ed2d16c8138afa8cce335f3fa1497e3')
sha256sums_x86_64=('fa97038d6f6bd325bb6cf3ad66f1c0a9ccea0c0700ab3927152f1a47eb1cd9dd')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

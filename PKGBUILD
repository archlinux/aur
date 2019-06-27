# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=usacloud-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('i686' 'x86_64')
url="https://github.com/sacloud/usacloud"
license=('Apache')
source_i686=("${url}/releases/download/v${pkgver}/usacloud_linux-386.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/usacloud_linux-amd64.zip")
sha256sums_i686=('19eaaeefd61d052ed12bf2e7156177e62f5f31bc2f27f0d3b344c03bf93aa2ad')
sha256sums_x86_64=('38860c233b4cbd5967e5eebf54f5e658eda9f28e26f4477fd26db4064a5627ae')


package() {
    install -dm755 ${pkgdir}/usr/bin
    cp -a ${srcdir}/usacloud ${pkgdir}/usr/bin
}

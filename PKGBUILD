# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.4.1
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
source=("https://github.com/SrKomodo/shadowfox-updater/releases/download/v${pkgver}/shadowfox_linux_amd64")
md5sums=('cdf9e3da146f790ce7161d7bfe3f237e')

package() {
    install -dm755 $pkgdir/usr/bin
    install -m755 shadowfox_linux_amd64 $pkgdir/usr/bin/shadowfox-updater
}

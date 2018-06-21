# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.5.2
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
source=("shadowfox-updater-${pkgver}::https://github.com/SrKomodo/shadowfox-updater/releases/download/v${pkgver}/shadowfox_linux_amd64")
md5sums=('7282dd1d849b2528974deca07c729601')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "shadowfox-updater-$pkgver" "$pkgdir/usr/bin/shadowfox-updater"
}

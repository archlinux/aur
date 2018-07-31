# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.5.9
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
source=("${pkgname}_${pkgver}_Linux_x64.tar.gz::https://github.com/SrKomodo/shadowfox-updater/releases/download/v$pkgver/${pkgname}_${pkgver}_Linux_x64.tar.gz")
md5sums=('e6ccd8113edc4cfa05da8dc4c390032a')

package() {
    tar -xf "${pkgname}_${pkgver}_Linux_x64.tar.gz"
    install -dm 755 "$pkgdir/usr/bin"
    install -m 755 "shadowfox" "$pkgdir/usr/bin/$pkgname"
}

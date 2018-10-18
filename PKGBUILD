# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.7.13
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
_filename=shadowfox_linux_x64
source=("${_filename}_$pkgver::https://github.com/SrKomodo/shadowfox-updater/releases/download/v$pkgver/$_filename")
md5sums=('2c756996477922cea099cd0c762f9ce3')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -m 755 "${_filename}_$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.7.20
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
_filename=shadowfox_linux_x64
source=("${_filename}_$pkgver::https://github.com/SrKomodo/shadowfox-updater/releases/download/v$pkgver/$_filename")
md5sums=('c60405e44a5e05619a8a8740354e0150')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -m 755 "${_filename}_$pkgver" "$pkgdir/usr/bin/$pkgname"
}

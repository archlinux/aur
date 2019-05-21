# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=2.0.0
pkgrel=3
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
optdepends=('zenity: For graphical UI')
_filename=shadowfox_linux_x64
source=("${_filename}_$pkgver::https://github.com/SrKomodo/shadowfox-updater/releases/download/v$pkgver/$_filename")
md5sums=('3d25d085946f7f2ac77ae4e9ce3f6a9d')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -m 755 "${_filename}_$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.7.10
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
_filename=shadowfox_linux_x64
source=("$_filename::https://github.com/SrKomodo/shadowfox-updater/releases/download/v$pkgver/$_filename")
md5sums=('63be63be725922962cdda07942d77744')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -m 755 "$_filename" "$pkgdir/usr/bin/$pkgname"
}

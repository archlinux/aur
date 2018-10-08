# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.7.11
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
_filename=shadowfox_linux_x64
source=("$_filename::https://github.com/SrKomodo/shadowfox-updater/releases/download/v$pkgver/$_filename")
md5sums=('e7555436b2a84866046f7cbd2bd40d76')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -m 755 "$_filename" "$pkgdir/usr/bin/$pkgname"
}

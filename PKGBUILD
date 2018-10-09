# Maintainer: Vojtech Balak <balakvojtech@gmail.com>
pkgname='shadowfox-updater'
pkgver=1.7.12
pkgrel=1
pkgdesc='An auto-updater for ShadowFox'
arch=('x86_64')
url='https://github.com/SrKomodo/shadowfox-updater'
license=('MIT')
_filename=shadowfox_linux_x64
source=("${_filename}_$pkgver::https://github.com/SrKomodo/shadowfox-updater/releases/download/v$pkgver/$_filename")
md5sums=('7eb4cd0aad5aaefd587386b803075c22')

package() {
    install -dm 755 "$pkgdir/usr/bin"
    install -m 755 "${_filename}_$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=asciiquarium-lock
pkgver=1.3.1
pkgrel=1
pkgdesc="Simple screen locker using ASCIIQuarium as a screensaver"
arch=('any')
url="https://github.com/YanDoroshenko/asciiquarium-lock"
license=('GPL')
depends=('awk' 'asciiquarium' 'xfce4-terminal' 'pyxtrlock' 'xorg-server')
optdepends=('xkblayout-state: Restore the selected layout after unlock', 'xorg-xrandr: Multihead support')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname".sh")
sha256sums=('30e9ae8647dabd1e9a3dbe0ccf8d8dc886ed31fe5dad5778d24be3cebe0f096e')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
    chmod +x "$pkgdir"/usr/bin/"$pkgname"
}

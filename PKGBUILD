# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=asciiquarium-lock
pkgver=1.3
pkgrel=1
pkgdesc="Simple screen locker using ASCIIQuarium as a screensaver"
arch=('any')
url="https://github.com/YanDoroshenko/asciiquarium-lock"
license=('GPL')
depends=('awk' 'asciiquarium' 'xfce4-terminal' 'pyxtrlock' 'xorg-server')
optdepends=('xkblayout-state: Restore the selected layout after unlock', 'xorg-xrandr: Multihead support')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname".sh")
sha256sums=('2e0dcb1688d9791764066a7c6eb6a6304d5bf6eb10997e24b9549d95d336035f')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
    chmod +x "$pkgdir"/usr/bin/"$pkgname"
}

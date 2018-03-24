# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=asciiquarium-lock
pkgver=1.1
pkgrel=1
pkgdesc="Simple screen locker using ASCIIQuarium as a screensaver"
arch=('any')
url="https://github.com/YanDoroshenko/asciiquarium-lock"
license=('GPL')
depends=('awk' 'asciiquarium' 'xfce4-terminal' 'xtrlock' 'xorg-server')
optdepends=('xkblayout-state: Restore the selected layout after unlock', 'xorg-xrandr: Multihead support')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname".sh")
sha256sums=('075ee18f4de858f2b90c7de15894899e153d48d6b4acc1dadb7fe85ccf1d813e')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
    chmod +x "$pkgdir"/usr/bin/"$pkgname"
}

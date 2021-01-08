pkgname=auto-xrandr
pkgver=1.0
pkgrel=1
pkgdesc="Automatically configure xrandr when a display is connected or disconnected"
arch=('any')
license=('MIT')
source=("auto-xrandr"
        "50-auto-xrandr.rules"
        "auto-xrandr.1"
        "LICENSE")
md5sums=('8318174020e291f92200699b7d2eae87'
         '1fe793614e16d43d7ac23ff49194779f'
         '6150fd40022bcacc38a92114c7756ad5'
         'e0dd463a730f70e341bfd18a4e6d2b3d')

package() {
    install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/auto-xrandr"
    install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir/50-auto-xrandr.rules"
    install -Dm644 -t "$pkgdir/usr/share/man/man1" "$srcdir/auto-xrandr.1"
    install -Dm644 -t "$pkgdir/usr/share/licenses/auto-xrandr" "$srcdir/LICENSE"
}

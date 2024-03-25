pkgname=faugus-launcher
pkgver=1.0
pkgrel=12
pkgdesc="Simple and Lightweight Proton Games Launcher"
arch=('x86_64')
license=('GPL')
depends=('python' 'python-gobject' 'umu-launcher' 'icoutils')
provides=('faugus-launcher')
conflicts=('faugus-launcher')

source=("faugus-launcher.py" "faugus-launcher.desktop" "faugus-launcher.png")
sha256sums=('4da7e615c9575c914c54efafef13c8405ebf32c05473f9a08d8a219c8806d0b1'
            '7ee643017060562d27ad3f0960911bf7e5299df8d526863dd428f84a4765aa67'
            '36ca089b98e4169f17572dde833bd1039f8f5484a40ca307e6871de3814ea159')

package() {
    install -Dm755 faugus-launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm644 faugus-launcher.desktop "$pkgdir/usr/share/applications/faugus-launcher.desktop"
    install -Dm644 faugus-launcher.png "$pkgdir/usr/share/icons/faugus-launcher.png"
}

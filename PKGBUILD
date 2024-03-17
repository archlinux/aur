pkgname=faugus-launcher
pkgver=1.0
pkgrel=3
pkgdesc="Simple game launcher"
arch=('x86_64')
license=('GPL')
depends=('python' 'python-gobject')
provides=('faugus-launcher')
conflicts=('faugus-launcher')

source=("faugus-launcher.py" "ulwgl-faugus" "faugus-launcher.desktop" "faugus-launcher.png")
sha256sums=('b42cb8d5ccf6f146f642121da52b8658008724ae57c61f08b08cddd0b189c2bc'
            'd492d9e9de8ae2be9e7efe5f6d40a49aab3653727445313a0c0285608555fe54'
            '7ee643017060562d27ad3f0960911bf7e5299df8d526863dd428f84a4765aa67'
            '36ca089b98e4169f17572dde833bd1039f8f5484a40ca307e6871de3814ea159')

package() {
    install -Dm755 faugus-launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm755 ulwgl-faugus "$pkgdir/usr/bin/ulwgl-faugus"
    install -Dm644 "faugus-launcher.desktop" "$pkgdir/usr/share/applications/faugus-launcher.desktop"
    install -Dm644 faugus-launcher.png "$pkgdir/usr/share/icons/faugus-launcher.png"
}

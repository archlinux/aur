pkgname=faugus-launcher
pkgver=1.0
pkgrel=6
pkgdesc="Simple and Lightweight Proton Games Launcher"
arch=('x86_64')
license=('GPL')
depends=('python' 'python-gobject')
provides=('faugus-launcher')
conflicts=('faugus-launcher')

source=("faugus-launcher.py" "ulwgl-faugus" "faugus-launcher.desktop" "faugus-launcher.png")
sha256sums=('cc635e36da98b4b7f7fb2ff6cfdbc2658dba033440cca691a97151f42f53b439'
            'd492d9e9de8ae2be9e7efe5f6d40a49aab3653727445313a0c0285608555fe54'
            '7ee643017060562d27ad3f0960911bf7e5299df8d526863dd428f84a4765aa67'
            '36ca089b98e4169f17572dde833bd1039f8f5484a40ca307e6871de3814ea159')

package() {
    install -Dm755 faugus-launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm755 ulwgl-faugus "$pkgdir/usr/bin/ulwgl-faugus"
    install -Dm644 "faugus-launcher.desktop" "$pkgdir/usr/share/applications/faugus-launcher.desktop"
    install -Dm644 faugus-launcher.png "$pkgdir/usr/share/icons/faugus-launcher.png"
}

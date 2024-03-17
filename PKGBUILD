pkgname=faugus-launcher
pkgver=1.0
pkgrel=1
pkgdesc="Simple game launcher"
arch=('x86_64')
license=('GPL')
depends=('python' 'python-gobject')
provides=('faugus-launcher')
conflicts=('faugus-launcher')

source=("faugus-launcher.py" "ulwgl-faugus")
sha256sums=('6b555602f9c767ceedbd3f478d12eb6b32208d7d398eb14b32b64773eda471a1'
            'd492d9e9de8ae2be9e7efe5f6d40a49aab3653727445313a0c0285608555fe54')

package() {
    install -Dm755 faugus-launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm755 ulwgl-faugus "$pkgdir/usr/bin/ulwgl-faugus"
}
pkgname=faugus-launcher
pkgver=1.0
pkgrel=1
pkgdesc="Simple game launcher"
arch=('any')
url=""
license=('GPL')
depends=('python' 'python-gobject')

source=("faugus-launcher.py" "ulwgl-faugus")
sha256sums=('0194700a5f9fafbcf389d3cb22e875e2e17d263ab7f5e46a8e62705f10eb1f34'
            'd492d9e9de8ae2be9e7efe5f6d40a49aab3653727445313a0c0285608555fe54')

package() {
    install -Dm755 faugus-launcher.py "$pkgdir/usr/bin/faugus-launcher"
    install -Dm755 ulwgl-faugus "$pkgdir/usr/bin/ulwgl-faugus"
}
# Maintainer: Young Fellow <youngfellow.le@gmail.com>
pkgname=setcustomres
pkgver=2.0
pkgrel=1
pkgdesc="A utility that helps setting resolutions to monitors using (xrandr)"
arch=('any')
url="https://github.com/YoungFellow-le/setcustomres"
license=('GPL3')
depends=('libxrandr' 'awk')
provides=('setcustomres')
conflicts=('setcustomres')
source=("v$pkgver.tar.gz::https://github.com/YoungFellow-le/setcustomres/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f90b3d2055e587231c3859c751014049')

package()
{
    # Install Script
    install -Dm755 $srcdir/setcustomres-$pkgver/$pkgname.sh "$pkgdir"/usr/bin/$pkgname

    # Install License
    install -Dm644 $srcdir/setcustomres-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Young Fellow <youngfellow.le@gmail.com>
pkgname=setcustomres
pkgver=1.0.1
pkgrel=1
pkgdesc="A utility that helps setting resolutions to monitors using (xrandr)"
arch=('any')
url="https://github.com/YoungFellow-le/setcustomres"
license=('GPL3')
depends=('libxrandr' 'awk')
provides=('setcustomres')
conflicts=('setcustomres')
source=("v$pkgver.tar.gz::https://github.com/YoungFellow-le/setcustomres/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('769a3ee8de387405370989bba37f44c9')

package()
{
    # Install Script
    install -Dm755 $srcdir/setcustomres-$pkgver/$pkgname.sh "$pkgdir"/usr/bin/$pkgname

    # Install License
    install -Dm644 $srcdir/setcustomres-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

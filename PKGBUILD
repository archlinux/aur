# Maintainer: Young Fellow <youngfellow.le@gmail.com>
pkgname=setcustomres
pkgver=2.1
pkgrel=1
pkgdesc="A tool that summarizes the process of setting a custom resolution to a monitor using xrandr."
arch=('any')
url="https://github.com/YoungFellow-le/setcustomres"
license=('GPL3')
depends=('libxrandr' 'awk')
provides=('setcustomres')
conflicts=('setcustomres')
source=("v$pkgver.tar.gz::https://github.com/YoungFellow-le/setcustomres/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('3a5f79e1cb1140423a391a2cb848994b')

package()
{
    # Install Script
    install -Dm755 $srcdir/setcustomres-$pkgver/$pkgname.sh "$pkgdir"/usr/bin/$pkgname

    # Install License
    install -Dm644 $srcdir/setcustomres-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

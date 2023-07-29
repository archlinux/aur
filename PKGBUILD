# Maintainer: MisconceivedSec (@misconceivedsec)
pkgname=setcustomres
pkgver=2.2.1
pkgrel=2
pkgdesc="A tool that summarizes the process of setting a custom resolution to a monitor using xrandr."
arch=('any')
url="https://github.com/MisconceivedSec/setcustomres"
license=('GPL3')
depends=('libxrandr' 'awk')
provides=('setcustomres')
conflicts=('setcustomres')
source=("v$pkgver.tar.gz::https://github.com/MisconceivedSec/setcustomres/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('778640e202b7cee3a7220defcdd70d15')

package()
{
    # Install Script
    install -Dm755 $srcdir/setcustomres-$pkgver/$pkgname.sh "$pkgdir"/usr/bin/$pkgname

    # Install License
    install -Dm644 $srcdir/setcustomres-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

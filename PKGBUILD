# Maintainer: Guillermo Garcia <ahioros@NO-SPAM.gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Guillermo Garcia <ahioros@NO-SPAM.gmail.com>

pkgname="plymouth-theme-arch-logo"
pkgver=0.1
pkgrel=3
url="http://gnome-look.org/content/show.php/Arch-logo+plymouth?content=141697"
pkgdesc="Arch-logo is a remake of ubuntu-logo plymouth"
arch=('any')
license=('GPL')
depends=('plymouth')
source=("http://gnome-look.org/CONTENT/content-files/141697-Arch-logo-plymouth.tar.gz")
sha256sums=('553ab3efd51abefc50c10b521c24183df9ef879d080a75c54fb1c1512fbc94e6')

package() {
    cd $srcdir/arch-logo
    mkdir -p $pkgdir/usr/share/plymouth/themes/arch-logo
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/arch-logo
    install -Dm644 ../arch-logo.png $pkgdir/usr/share/plymouth/themes/arch-logo.png
}

# Maintainer: Nagy Gabor <Gabor.V.Nagy@@gmail.com>

pkgname=xfce-theme-cobibird
pkgver=1.6u2
pkgrel=1
pkgdesc="A GTK theme based on Greybird, with dark menus (unofficial GTK 3.20 port)"
arch=(any)
url=http://gnome-look.org/content/show.php/CobiBird?content=157985
license=('GPL' 'CCPL:cc-by-sa')
depends=(gtk-engine-murrine)
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme')
source=(http://ngaba.uw.hu/CobiBird/CobiBird-$pkgver.tar.gz)
md5sums=('88e59b8884e6e987232a4579e40f609d')

package() {
    install -d "$pkgdir"/usr/share/themes/
    cp -rf CobiBird-$pkgver/ "$pkgdir"/usr/share/themes/CobiBird/
}

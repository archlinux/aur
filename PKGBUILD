# Maintainer: Nagy Gabor <Gabor.V.Nagy@@gmail.com>

pkgname=xfce-theme-cobibird
pkgver=2.1
pkgrel=2
pkgdesc="A GTK theme based on Greybird, with dark menus"
arch=(any)
url=http://gnome-look.org/content/show.php/CobiBird?content=157985
license=('GPL' 'CCPL:cc-by-sa')
depends=(gtk-engine-murrine)
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme')
source=(https://github.com/Cobinja/CobiBird/archive/$pkgver.zip)
md5sums=('a86d5d0dfd1c184986adca2449b10fe4')

package() {
    install -d "$pkgdir"/usr/share/themes/
    cp -rf CobiBird-$pkgver/ "$pkgdir"/usr/share/themes/CobiBird/
}

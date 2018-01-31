# Maintainer: Nagy Gabor <Gabor.V.Nagy@@gmail.com>

pkgname=xfce-theme-cobibird
pkgver=2.1.6
pkgrel=1
pkgdesc="A GTK theme based on Greybird, with dark menus"
arch=(any)
url=http://gnome-look.org/content/show.php/CobiBird?content=157985
license=('GPL' 'CCPL:cc-by-sa')
depends=(gtk-engine-murrine)
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme')
source=(https://github.com/Cobinja/CobiBird/archive/$pkgver.tar.gz)
md5sums=('52d8be5ec8113d852171e45101592a92')

package() {
    install -d "$pkgdir"/usr/share/themes/
    cp -rf CobiBird-$pkgver/ "$pkgdir"/usr/share/themes/CobiBird/
}

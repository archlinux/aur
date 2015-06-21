# Maintainer: Nagy Gabor <Gabor.V.Nagy@@gmail.com>

pkgname=xfce-theme-cobibird
pkgver=1.5
pkgrel=1
pkgdesc="A Gtk theme based on Greybird, with dark menus as Greybird was until its version 0.8.2"
arch=(any)
url=http://gnome-look.org/content/show.php/CobiBird?content=157985
license=('GPL' 'CCPL:cc-by-sa')
depends=(gtk-engine-murrine)
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme')
source=(CobiBird-$pkgver.tar.gz::https://github.com/Cobinja/CobiBird/archive/$pkgver.tar.gz)
md5sums=('04aec28264fb30db8d695fc383b159e1')

package() {
    install -d "$pkgdir"/usr/share/themes/
    cp -rf CobiBird-$pkgver/ "$pkgdir"/usr/share/themes/CobiBird/
    rm "$pkgdir"/usr/share/themes/CobiBird/.gitignore
}

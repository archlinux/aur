# Maintainer: caiye <ye[dot]jingchen [at] gmail[dot]com>
# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=elementary-theme
pkgver=5.1.1
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.xz::https://launchpad.net/egtk/5.x/$pkgver/+download/elementary-theme-$pkgver.tar.xz")
sha256sums=('35b005a76ebc013726ba63e104b461ccff0fa888711833888dd1f59229e3deaa')

package() {
    install -d "$pkgdir/usr/share/themes"
    mv $srcdir/"$_realname-$pkgver" $pkgdir/usr/share/themes/elementary
}

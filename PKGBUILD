# Maintainer: caiye <ye dot jingchen at gmail dot com>
# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=elementary-theme
pkgver=5.1.0
pkgrel=1
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL3')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.xz::https://launchpad.net/egtk/5.x/$pkgver/+download/elementary-theme-$pkgver.tar.xz")
sha256sums=('ed1022e6e508b706aaf55b8076d6c90532f7c4f876950c2f707f54cfec383766')

package() {
cd "$_realname-$pkgver"

install -d $pkgdir/usr/share/themes
mv $srcdir/"$_realname-$pkgver" $pkgdir/usr/share/themes/elementary
}


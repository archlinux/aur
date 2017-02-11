# Maintainer: goetzc
# Contributors: Ner0

pkgname=gtk-theme-elementary
_realname=elementary-theme
pkgver=5.0.3
pkgrel=2
pkgdesc="The official elementary GTK theme designed to be smooth, attractive, fast, and usable."
arch=('any')
url="https://launchpad.net/egtk"
license=('GPL2')
groups=('pantheon')
optdepends=('elementary-icon-theme: the elementary icon theme')
conflicts=('elementary-gtk-theme' 'egtk-bzr')
source=("$pkgname-$pkgver.tar.xz::https://launchpad.net/egtk/5.x/$pkgver/+download/elementary-theme-$pkgver.tar.xz")
sha256sums=('7a47fb30c4a0c72af31296feb51dba24801c16949a9bab34d97de78457638db0')

package() {
cd "$_realname-$pkgver"

install -d $pkgdir/usr/share/themes
mv $srcdir/"$_realname-$pkgver" $pkgdir/usr/share/themes/elementary
}


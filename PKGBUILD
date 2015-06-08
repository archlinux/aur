# Maintainer : fredbezies <fredbezies at gmail dot com>
# Contributor: ubunblox <ubunblox@gmail.com>

pkgname=simplistica-icon-theme
pkgver=1.0
pkgrel=2
pkgdesc="Icon theme for GTK"
arch=('any')
url="http://pr09studio.yolasite.com/themes.php"
license=('GPL')
depends=('gtk2')
source=(http://ubunblox.free.fr/UbunBlox/AUR/$pkgname-$pkgver.tar.gz)
md5sums=('a940d3698be0fb9fd6920a1ca611952d')

package() {
	mkdir -p $pkgdir/usr/share/icons/
        cd $srcdir/
	tar -xf $pkgname-$pkgver.tar.gz        
        cp -r $srcdir/Simplistica $pkgdir/usr/share/icons/
        chmod -R 777 $pkgdir/usr/share/icons/Simplistica
        chown -R root:users $pkgdir/usr/share/icons/Simplistica
}


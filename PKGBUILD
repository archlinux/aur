# Maintainer: Travis Lyons <travis.lyons@gmail.com>

pkgname=clearlooks-colors-gtk-theme
pkgver=2.0
pkgrel=6
pkgdesc="A GTK theme that works well with the gnome-colors icon theme"
arch=('any')
optdepends=('gnome-colors-icon-theme: GNOME Colors icon theme' )
url="http://www.gnome-look.org/content/show.php/Clearlooks-Colors?content=75417"
license=('GPL')
source=(http://www.gnome-look.org/CONTENT/content-files/75417-Clearlooks-Colors.tar.gz)
md5sums=('72731cef7e7f6e5a59ca4ea5269f8651')

package() {
	install -d -m755 $pkgdir/usr/share/themes
	cd $pkgdir/usr/share/themes
	cp -r $srcdir/Clearlooks* ./
	cp -r $srcdir/X-Colors* ./
}

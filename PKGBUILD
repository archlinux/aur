# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows8-cursor
pkgver=1.01
pkgrel=5
pkgdesc="Cursors similliar to Windows 8 cursor"
arch=('any')
url="http://gnome-look.org/content/show.php/?content=155025"
license=("GPL")
source=("https://dl.opendesktop.org/api/files/download/id/1460735137/155025-win8.tar.gz")
sha1sums=('a5385e8e0dcb319287f1a99b4eb90be3c27ce1a2')

package()
{
	cd win8

	install -d -m 755 "$pkgdir/usr/share/icons/Windows8-cursor/cursors"

    cp -a cursors/* "$pkgdir/usr/share/icons/Windows8-cursor/cursors"
	install -D -m 644 index.theme "$pkgdir/usr/share/icons/Windows8-cursor/index.theme"   

}

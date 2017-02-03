# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows8-cursor
pkgver=1.01
pkgrel=4
pkgdesc="Cursors similliar to Windows 8 cursor"
arch=('any')
url="http://gnome-look.org/content/show.php/?content=155025"
license=("GPL")
source=("https://dl.opendesktop.org/api/files/download/id/1460735137/155025-win8.tar.gz")
sha1sums=('d0707f4f5b2e669cea4139f3df6863572082bbba')

package()
{
	cd win8

	install -d -m 755 "$pkgdir/usr/share/icons/Windows8-cursor/cursors"

    cp -a cursors/* "$pkgdir/usr/share/icons/Windows8-cursor/cursors"
	install -D -m 644 index.theme "$pkgdir/usr/share/icons/Windows8-cursor/index.theme"   

}

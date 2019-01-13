# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows8-cursor
pkgver=1.01
pkgrel=5
pkgdesc="Cursors similliar to Windows 8 cursor"
arch=('any')
url="http://gnome-look.org/content/show.php/?content=155025"
license=("GPL")
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1460735137/s/e6598df800b1e29b5b3f045dfdc69dda/t/1516944582/u//155025-win8.tar.gz")
sha1sums=('SKIP')

package()
{
	tar -xzf  155025-win8.tar.gz

	cd win8

	install -d -m 755 "$pkgdir/usr/share/icons/Windows8-cursor/cursors"

	cp -a cursors/* "$pkgdir/usr/share/icons/Windows8-cursor/cursors"
	install -D -m 644 index.theme "$pkgdir/usr/share/icons/Windows8-cursor/index.theme"

}

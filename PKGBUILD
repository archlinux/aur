# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows8-cursor
pkgver=1.01
pkgrel=5
pkgdesc="Cursors similliar to Windows 8 cursor"
arch=('any')
url="http://gnome-look.org/content/show.php/?content=155025"
license=("GPL")
source=("https://github.com/Zerophase/windows8-cursor/archive/master.zip")
sha1sums=('85088eaab90f8ca9413ffc951dd68bfd8bba29d1')

package()
{
	unzip -oq  master.zip

	cd ./windows8-cursor-master/

	tar -xzf  155025-win8.tar.gz

	cd win8

	install -d -m 755 "$pkgdir/usr/share/icons/Windows8-cursor/cursors"

	cp -a cursors/* "$pkgdir/usr/share/icons/Windows8-cursor/cursors"
	install -D -m 644 index.theme "$pkgdir/usr/share/icons/Windows8-cursor/index.theme"

}

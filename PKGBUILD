# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows10-icons
pkgver=0.5
pkgrel=3
pkgdesc="Icons to emulate a Windows 10 look"
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
# depends
source=("git+ssh://git@github.com/B00merang-Artwork/Windows-10.git")
sha1sums=('SKIP')

package()
{
	cd "$srcdir/Windows-10"

	install -d -m 755 "$pkgdir/usr/share/icons/Windows-10-Icons"

	cp -a * "$pkgdir/usr/share/icons/Windows-10-Icons"
	find "$pkgdir/usr/share/icons/Windows-10-Icons" -type f -exec chmod 644 {} + 
	find "$pkgdir/usr/share/icons/Windows-10-Icons" -type l -exec chmod -c 644 {} +
}

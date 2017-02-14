# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows10-icons
pkgver=0.5
pkgrel=1
pkgdesc="Icons to emulate a Windows 10 look"
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
# depends
source=("https://github.com/B00merang-Project/Windows-10/releases/download/v0.9.9-AU/Windows.10.Icons.v0.5.tar.gz")
sha1sums=('0268015ec0f43d7944ee096b400bbf2a221c58ca')

package()
{
	cd Windows\ 10\ Icons

	install -d -m 755 "$pkgdir/usr/share/icons/Windows-10-Icons"

	find . -type f -exec \
		install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows-10-Icons/{}" \;

	find . -type l -exec \
		install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows-10-Icons/{}" \;
}

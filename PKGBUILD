# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows10-icons
pkgver=0.4.2
pkgrel=1
pkgdesc="Icons to emulate a Windows 10 look"
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
# depends
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.9.7/Windows.10.Icons.v0.4.2.zip")
sha1sums=('435b20fdf0ffbfd9ac0f0dea1c1458cf67e8278d')

package()
{
	cd Windows\ 10\ Icons

	install -d -m 755 "$pkgdir/usr/share/icons/Windows-10-Icons"

	find . -type f -exec \
		install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows-10-Icons/{}" \;

	find . -type l -exec \
		install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows-10-Icons/{}" \;
}

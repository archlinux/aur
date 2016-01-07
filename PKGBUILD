# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows10-icons
pkgver=0.2.2
pkgrel=1
pkgdesc="Icons to emulate a Windows 10 look"
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
# depends
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.8.3/Windows.10.Icons.v0.2.2.zip")
sha1sums=('20fb3ac1137962ba0c503c6951532c398073b5ba')

package()
{
	cd Windows\ 10\ Icons

	install -d -m 755 "$pkgdir/usr/share/icons/Windows10Icons"

	find . -type f -exec \
		install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows10Icons/{}" \;
}
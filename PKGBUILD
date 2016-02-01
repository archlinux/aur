# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=windows10-icons
pkgver=0.3
pkgrel=1
pkgdesc="Icons to emulate a Windows 10 look"
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
# depends
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.9/Windows.10.Icons.v0.3.zip")
sha1sums=('10242d48883eb971000a322c47033b9fc98fc02c')

package()
{
	cd Windows\ 10\ Icons

	install -d -m 755 "$pkgdir/usr/share/icons/Windows 10"

	find . -type f -exec \
		install -D -m 644 '{}' "$pkgdir/usr/share/icons/Windows 10/{}" \;
}
# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname='windows10-tint2rc'
pkgver=0.8.4
pkgrel=2
pkgdesc="tin2rc file for windows10 gtk theme"
arch=('any')
url="https://github.com/Elbullazul/windows-10"
license=('GPL')
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.8.4/tint2rc")
sha1sums=('039e19b79d169cee6617936879b8ee638b8bebf7')

package()
{
	mv tint2rc windows10.tint2rc

  	install -D -m 755 windows10.tint2rc "$pkgdir/usr/share/tint2/windows10.tint2rc"
}
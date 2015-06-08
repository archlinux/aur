# Idea: swiergot (https://bbs.archlinux.org/viewtopic.php?id=16754)
# Code update: Alad W (http://github.com/AladW)
# Package: Jakob (http://github.com/nasenatmer)

pkgname=dotpac
pkgver=0.4
pkgrel=1
pkgdesc="Bash script to get rid of *.pac* files."
arch=(any)
license=('BSD')
url="http://wiki.archlinux.org/index.php/dotpac"
depends=('bash')
source=('https://raw.githubusercontent.com/AladW/scripts/master/dotpac')
sha256sums=('032c7726d4d571cbc9f94acb42be30366a4f7ea2a90f901939a6298c1942d46c')

package() {
	install -D -m755 dotpac $pkgdir/usr/bin/dotpac
}

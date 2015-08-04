# Idea: swiergot (https://bbs.archlinux.org/viewtopic.php?id=16754)
# Code update: Alad W (http://github.com/AladW)
# Package: Jakob (http://github.com/nasenatmer)

pkgname=dotpac
pkgver=0.4
pkgrel=3
pkgdesc="Bash script to get rid of *.pac* files."
arch=(any)
license=('BSD')
url="http://wiki.archlinux.org/index.php/dotpac"
depends=('bash' 'dialog')
source=('https://raw.githubusercontent.com/AladW/scripts/master/bin/old/dotpac')
md5sums=('7984de79ee51711b5b26eaf4e477b6df')

package() {
	install -D -m755 dotpac $pkgdir/usr/bin/dotpac
}

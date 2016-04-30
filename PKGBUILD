# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=tf
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A tag finder for web page template"
arch=('any')
url="https://github.com/yanganto/python-tools/blob/master/tag_finder.py"
license=('BSD')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("python-tools::git+https://github.com/yanganto/python-tools")
md5sums=(SKIP)
noextract=()
noprepare=()
package(){
	mkdir -p $pkgdir/usr/bin
	chmod +x $srcdir/python-tools/tag_finder.py
	cp $srcdir/python-tools/tag_finder.py $pkgdir/usr/bin/tf
}


# Maintainer: Ezekiel Bethel <mctinfoilball@gmail.com>

pkgname=unrpyc
pkgver=20150709
pkgrel=1
pkgdesc="A ren'py script decompiler"
arch=("any")
url="http://github.com/CensoredUsername/unrpyc"
license=('MIT')
depends=("python2")
source=("git+$url")
md5sums=('SKIP')

package() {
	rm -rf $srcdir/unrpyc/.git
	mkdir -p $pkgdir/usr/{bin,share/licenses/unrpyc}
	cp -r $srcdir/unrpyc $pkgdir/usr/share
	chmod +x $pkgdir/usr/share/unrpyc/unrpyc.py
	ln -s /usr/share/unrpyc/unrpyc.py $pkgdir/usr/bin/unrpyc
	ln -s /usr/share/unrpyc/LICENSE $pkgdir/usr/share/licenses/unrpyc/LICENSE
}

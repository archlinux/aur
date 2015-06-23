# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mauro Andreolini <mauro.andreolini@gmail.com>

pkgname=fortune-mod-kernelnewbies
pkgver=20131209
pkgrel=1
pkgdesc="Fortune cookie collection by miscellaneous Linux kernel newbies"
arch=('any')
url=('http://fortunes.cat-v.org/kernelnewbies/')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(kernelnewbies.gz)
md5sums=('8988729444de707f69958c837e0ca9b3')

build() {
	cd $srcdir
	strfile kernelnewbies
}

package() {
	mkdir -p $pkgdir/usr/share/fortune
	install -m644 $srcdir/kernelnewbies $pkgdir/usr/share/fortune
	install -m644 $srcdir/kernelnewbies.dat $pkgdir/usr/share/fortune
}

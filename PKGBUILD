# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>
# Contributor: Baobab <eternal.baobab@gmail.com>

pkgname=fatcalc
pkgver=1.1.1.32
pkgrel=2
pkgdesc="Body fat calculator"
arch=('any')
url="http://sourceforge.net/projects/fatcalc"
license=('GPL')
depends=("java-environment")
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-${pkgver}-bin.tar.gz"
		"$pkgname.sh"
		"$pkgname.desktop"
		"$pkgname.png")
md5sums=('8c2b0563446cfc66d8b7fcd0530e4ec6'
         'ac0b8ea7315a454890c41e4e11350709'
         '7e2e2ae108235d6d8b402726b5cd967a'
         '3d62bb2e80ec7c1cdb0f5a842b1abf27')

package() {
    install -d $pkgdir/usr/share/java/$pkgname
    install -m644 $srcdir/$pkgname.jar $pkgdir/usr/share/java/$pkgname
    install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -D -m644 $srcdir/readme.txt $pkgdir/usr/share/doc/$pkgname/readme.txt
}

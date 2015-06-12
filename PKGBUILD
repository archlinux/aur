pkgname=amttool-tng
pkgver=1.7.3
pkgrel=1
pkgdesc="Utility to manage Intel AMT-aware devices (fork of Gerd Hoffmann's AMTTOOL)"
arch=('any')
url="http://sourceforge.net/projects/$pkgname/"
license=('GPL2')
depends=('perl-soap-lite')
source=("http://downloads.sourceforge.net/project/$pkgname/1.7/amttool"
        "http://downloads.sourceforge.net/project/$pkgname/1.7/README.txt"
        "http://downloads.sourceforge.net/project/$pkgname/1.7/amt_traps_v1.4.sh")
md5sums=('e6b55df2a4f4912277103ab36249fe5d'
         'c012156e1ede183c7a154b0a4b6bd14d'
         '222b81a003b8fd096f449d77d1d16614')

package() {
	cd "$srcdir"
	install -Dm755 amttool "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
	install -Dm755 amt_traps_v1.4.sh "$pkgdir/usr/share/$pkgname/amt_traps_v1.4.sh"
}

# vim: set ft=sh ts=4 sw=4 noet:

# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: cromo <dawid@klej.net>
pkgname=poster
pkgver=20060221
pkgrel=1
pkgdesc="Scales or tiles a postscript image to print on multiple pages"
arch=(i686 x86_64)
#url="http://printing.kde.org/downloads/"
url='http://directory.fsf.org/wiki/Poster'
license=('GPL')
source=("http://download.kde.org/printing/$pkgname.tar.bz2")
md5sums=('04b421e2ce516a44b6c5a9a092dfa623')

build() { 
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 $pkgname   "$pkgdir/usr/bin/$pkgname"
    install -D -m644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

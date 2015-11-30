# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>


pkgname=imdb-cli
pkgver=2.2
pkgrel=1
pkgdesc="Command line tool for retrieving IMDb movie information"
arch=(any)
license=('(L)GPL3')
url="https://github.com/Booloki/imdb-cli"
source=(https://github.com/Booloki/$pkgname/archive/$pkgver.tar.gz)
md5sums=('9ae891af5b9a9a96ff4bf579ce17f544')


package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -D -m755 "imdbtool"	"${pkgdir}/usr/bin/imdbtool"
    install -D -m644 "README.md" "${pkgdir}/usr/share/doc/imdbtool/README"
    install -D -m644 "LICENSE"	"${pkgdir}/usr/share/licenses/imdbtool/LICENSE"
}


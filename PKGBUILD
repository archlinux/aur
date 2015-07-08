# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>


pkgname=bdchapters
pkgver=0.4
pkgrel=1
pkgdesc="Command Line Chapter Extractor for Blu-ray Disc"
arch=(any)
license=('GPL3')
url="https://github.com/Booloki/bdchapters"
source=(https://github.com/Booloki/$pkgname/archive/$pkgver.tar.gz)
md5sums=('e516dd0c01a0346e3eaff2de4f92b7c3')


package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -D -m755 "bdchapters"	"${pkgdir}/usr/bin/bdchapters"
    install -D -m644 "README"		"${pkgdir}/usr/share/doc/bdchapters/README"
    install -D -m644 "LICENSE"	"${pkgdir}/usr/share/licenses/bdchapters/LICENSE"
}


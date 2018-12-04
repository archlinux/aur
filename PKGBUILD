# $Id$
# Maintainer : Nicolas Perrin <booloki@lokizone.net>


pkgname=bdchapters
pkgver=0.5
pkgrel=1
pkgdesc="Command Line Chapter Extractor for Blu-ray Disc"
arch=(any)
license=('GPL3')
url="https://github.com/Booloki/bdchapters"
source=(https://github.com/Booloki/$pkgname/archive/$pkgver.tar.gz)
md5sums=('27fb70c869bdb9b08146911caa95e4ac')


package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -D -m755 "bdchapters"	"${pkgdir}/usr/bin/bdchapters"
    install -D -m644 "README"		"${pkgdir}/usr/share/doc/bdchapters/README"
    install -D -m644 "LICENSE"	"${pkgdir}/usr/share/licenses/bdchapters/LICENSE"
}


# Maintainer: Nyarcel <nyarcel AT SPAMFREE gmail DOT com>
# Contributor: Leonid Isaev <lisaev@indiana.edu>

pkgname=lapack-manpages
pkgver=3.5.0
pkgrel=2
pkgdesc='LAPACK and BLAS manual pages'
arch=('any')
url='http://netlib.org/lapack'
license=('BSD')
depends=('man-db')
provides=('lapack-manpages')
source=('http://netlib.org/lapack/manpages.tgz'
        'LICENSE')
md5sums=('275687b7e06498798e88b1ca8481b3e2'
         '7d9f3a90a3f3d41052b70a31c1daf8ad')

package() {
	mkdir -p "$pkgdir/usr/share/man"
	cp -r "$srcdir/man/man3" "$pkgdir/usr/share/man"
}

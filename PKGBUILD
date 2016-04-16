# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Martin Miller <witsquash at lavabit dot com>
# Contributor: Christian Holme <cholme at gmx dot com>

pkgname=idlex
pkgver=1.13
pkgrel=1
pkgdesc="Extensions to IDLE, the Python IDE"
arch=('any')
url="http://idlex.sourceforge.net/"
license=('custom:NCSA')
depends=('python')
options=(!emptydirs)
source=("http://downloads.sourceforge.net/project/idlex/$pkgname-$pkgver.zip")
md5sums=('ddda3e3c36b19aac8a2bf69bf7cbedf1')


package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --prefix="$pkgdir/usr/"
    mkdir -p $pkgdir/usr/share/licenses
    cp -r $srcdir/$pkgname-$pkgver/license $pkgdir/usr/share/licenses/idlex
}


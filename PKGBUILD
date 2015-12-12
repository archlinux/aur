# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>

pkgname=python-svn
pkgver=0.3.36
pkgrel=2
pkgdesc="Lightweight Subversion library for Python."
arch=('any')
url="https://github.com/dsoprea/PySvn"
license=('GPL2')
depends=('python>=3.3' 'subversion' 'python-dateutil')
source=("https://pypi.python.org/packages/source/s/svn/svn-${pkgver}.tar.gz")
md5sums=('1538aeddf535de894dc81b6ffb76be34')

package() {
	cd "$srcdir/svn-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

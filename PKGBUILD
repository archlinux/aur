# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

pkgname=python-svn
pkgver=0.3.45
pkgrel=1
pkgdesc="Lightweight Subversion library for Python."
arch=('any')
url="https://github.com/dsoprea/PySvn"
license=('GPL2')
depends=('python>=3.3' 'subversion' 'python-dateutil')
source=("https://pypi.python.org/packages/c0/ea/ba24f6933d083306604e02d673ede6ddb81d89135b09dce76a1644d3df28/svn-${pkgver}.tar.gz")
md5sums=('db97c11b92175c76e157906d1705ddde')

package() {
	cd "$srcdir/svn-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

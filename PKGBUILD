# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>

pkgname=python-svn
pkgver=0.3.33
pkgrel=1
pkgdesc="Lightweight Subversion library for Python."
arch=('any')
url="https://github.com/dsoprea/PySvn"
license=('GPL2')
depends=('python>=3.3' 'subversion')
source=("https://pypi.python.org/packages/source/s/svn/svn-${pkgver}.tar.gz")
md5sums=('fdb5738c20c801ce5ae420042a76d2d3')

package() {
	cd "$srcdir/svn-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

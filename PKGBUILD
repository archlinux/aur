# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>

pkgname=python-svn
pkgver=0.3.35
pkgrel=1
pkgdesc="Lightweight Subversion library for Python."
arch=('any')
url="https://github.com/dsoprea/PySvn"
license=('GPL2')
depends=('python>=3.3' 'subversion')
source=("https://pypi.python.org/packages/source/s/svn/svn-${pkgver}.tar.gz")
md5sums=('f1f6399e581b6b4bd94f4d7008f54ecb')

package() {
	cd "$srcdir/svn-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}

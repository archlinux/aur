# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbnlib
_pyname="${pkgname#python-}"
pkgver=3.9.1
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('a2b9638c68e2db899c0d6cbf8531c3ed0171746708cb53755e5d6fff08b77331')

package(){
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

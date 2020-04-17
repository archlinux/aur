# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbntools
_pyname="${pkgname#python-}"
pkgver=4.3.22
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('LGPL3')
depends=('python' 'python-isbnlib')
makedepends=('python-setuptools')
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('93591027d9d3add90c0242bd51939e07a7dd34b56d83f8fb3112221d189a6aee')

package(){
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbntools
_pyname="${pkgname#python-}"
pkgver=4.3.23
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('LGPL3')
depends=('python' 'python-isbnlib')
makedepends=('python-setuptools')
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('57537f039ce188a666641cf5015f8042c17193d97d2817bffd9c3fbbe27eef68')

package(){
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

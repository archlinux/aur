# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbnlib
_pyname="${pkgname#python-}"
pkgver=3.9.6
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('6d77ade297963fc0def10c856db154f3ed76682533d832746a58a6b3bce71d30')

package(){
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

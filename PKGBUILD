# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbntools
_pyname="${pkgname#python-}"
pkgver=4.3.15
pkgrel=1
pkgdesc="Extract, clean, transform, hyphenate and metadata for ISBNs"
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('LGPL3')
depends=('python' 'python-isbnlib')
makedepends=('python-setuptools')
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('20b84572a5676313a945cdb66e3f3ef5953b38cf21ae1c1ba6a8b8ba718c253e')

package(){
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

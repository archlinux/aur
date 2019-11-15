# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbnlib
_pyname="${pkgname#python-}"
pkgver=3.9.9
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('68107fbc4504b4f278ef281dd2a5cf2a8dfba83cdcdb9ee3d293b53ad1cddbc8')

package(){
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

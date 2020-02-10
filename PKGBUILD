# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Francois Boulogne <fboulogne@april.org>

pkgname=python-isbnlib
_pyname="${pkgname#python-}"
pkgver=3.9.10
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=('any')
url="https://pypi.python.org/pypi/$_pyname"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/xlcnd/$_pyname/archive/v$pkgver.tar.gz")
sha256sums=('5e5325959ea5532db119563d7a6bc086cd55615dc9c48a21c4440dcebeafb2ad')

package(){
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

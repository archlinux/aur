
_project_name='id3parse'
pkgname="python-${_project_name}"
pkgver=0.1.1
pkgrel=1
pkgdesc="A parser and serializer for ID3v2 tags"
url="https://github.com/frececroka/id3parse.py/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/d9/fa/ab128ac6534bd6ab2ecceaa9b71844d2d45245df2f746e82b19020c8fd26/id3parse-0.1.1.tar.gz")

package() {
  cd "${srcdir}/${_project_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('20611aca4ff0ceb7b94a3d0287267a10')

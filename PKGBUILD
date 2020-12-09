# Maintainer: Midov <midov@midov.pl>

pkgname=python-pyfastcopy
_name=pyfastcopy
pkgver=1.0.3
pkgrel=2
pkgdesc="Python module that monkey patches the shutil.copyfile function of Python standard library to internally use the sendfile system call."
arch=('any')
url="https://pypi.org/project/pyfastcopy/"
license=('GPL')
depends=('python')
source=("https://files.pythonhosted.org/packages/43/80/535d6b3de415e26d0a1cb774c6895dd07aa5986d2f8bde200393bd916790/${_name}-${pkgver}.tar.gz")
sha256sums=('ed4620f1087a8949888973e315d3d59fbe9b8cc4ca5df553d76d2f21d2748999')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

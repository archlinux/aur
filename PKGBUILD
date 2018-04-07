# Maintainer: sumt <sumt at sci dot fi>

_name=Py3AMF
pkgname=python-py3amf
pkgver=0.8.8
pkgrel=1
pkgdesc="AMF support for Python"
arch=('x86_64')
url="https://github.com/StdCarrot/Py3AMF"
license=('MIT')
depends=('python-defusedxml')
makedepends=('python-setuptools')
provides=(python-pyamf=$pkgver)
conflicts=(python-pyamf)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('b37a8b78d7e2162cdb50c1bdb262db46')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


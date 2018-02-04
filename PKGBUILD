# Maintainer: sumt <sumt at sci dot fi>

_name=Py3AMF
pkgname=python-py3amf
pkgver=0.8.7
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
md5sums=('be02bf5c44016ea6889aa9b0247dcaa9')

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}


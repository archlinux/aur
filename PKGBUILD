pkgname='python-flask-expects-json'
_name=${pkgname#python-}
pkgver=1.7.0
pkgrel=3
pkgdesc="Decorator for REST endpoints in flask. Validate JSON request data."
arch=('any')
url="https://github.com/fischerfredl/flask-expects-json"
license=('MIT')
depends=(
  'python-flask'
  'python-jsonschema'
)
makedepends=(
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4ef186a86f10572a21af82e549546deda024326628b4a96cd14d3a0f71754d62')

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}


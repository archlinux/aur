pkgbase=python2-jsonschema
pkgname=('python2-jsonschema')
_name=${pkgbase#python2-}
pkgver=3.2.0
pkgrel=1
pkgdesc="An implementation of JSON Schema validation for Python"
arch=('any')
url="https://pypi.org/project/jsonschema/"
license=('MIT')
makedepends=('python2' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a')

package_python2-jsonschema() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

# vim: ts=2 sw=2 et:

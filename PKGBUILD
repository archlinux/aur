# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=dockerfile-parse
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}")
pkgver=2.0.1
pkgrel=1
arch=(any)
license=('BSD')
pkgdesc='Python library for parsing Dockerfile files.'
url='https://github.com/containerbuildsystem/dockerfile-parse'
makedepends=('python-setuptools')
source=("https://github.com/containerbuildsystem/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('85e9796d9c82e3df525e44cffe4a75e34378feafbea2b59caf8dd9facc9c7e7bb1052e06e2e2415b3bd75ba9ab83d73a70882d508d36afcddc4c52c41d913036')

package_python-dockerfile-parse() {
  depends=('python')
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_name=petname
pkgname="python-${_name}"
epoch=1
pkgver=2.14
pkgrel=1
pkgdesc="Generate human-readable, random object names."
arch=(any)
url="https://github.com/dustinkirkland/${pkgname}"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ea97222f42e2f7ed835c011fc1f09ef3b69aa59d5f0c39a6e9216ff9e44b9845')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

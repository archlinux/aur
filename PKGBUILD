# Maintainer: dtluna <dtluna at openmailbox dot org>

pkgname=gscli
pkgver=1.3.4
pkgrel=1
pkgdesc="CLI GNU Social client"
arch=('any')
url="https://gitgud.io/dtluna/${pkgname}"
license=('GPL3')
depends=('python' 'python-gnusocial' 'python-keyrings-alt' 'python-prompt_toolkit'
         'python-voluptuous' 'python-tzlocal' 'python-xdg')
makedepends=('python-setuptools')
source=("${url}/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('a9662e26c6b62fbf6510875d09c1825dbb1939b7de4c447e55a948d31b2addd3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-6aa65b671f04e1743e298681a3483b66483b28ea/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

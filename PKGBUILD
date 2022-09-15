# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ansible-lint-junit'
pkgname="python-${pkgbase}"
pkgver='0.17.6'
pkgrel='1'
pkgdesc='ansible-lint to JUnit converter'
arch=('any')
url="https://github.com/wasilak/${pkgbase}"
makedepends=('python' 'python-setuptools' 'python-lxml')
depends=('ansible-lint' 'python-lxml')
license=('BSD')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c4bc96d2a2bd877f30e7ed05262cee8813f077c5c072f43cff5e59b84b5e9464')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

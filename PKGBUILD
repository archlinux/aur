# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ansible-lint-junit'
pkgname="python-${pkgbase}"
pkgver='0.16'
pkgrel='1'
pkgdesc='ansible-lint to JUnit converter'
arch=('any')
url="https://github.com/wasilak/${pkgbase}"
makedepends=('python' 'python-setuptools' 'python-lxml')
depends=('ansible-lint' 'python-lxml')
license=('BSD')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c717fdeaac2efc7bcf5d9f80015e1cd7b2856d0fa7b5ca4f636d43b4d0c2315a')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ansible-lint-junit'
pkgname="python-${pkgbase}"
pkgver='0.17.4'
pkgrel='1'
pkgdesc='ansible-lint to JUnit converter'
arch=('any')
url="https://github.com/wasilak/${pkgbase}"
makedepends=('python' 'python-setuptools' 'python-lxml')
depends=('ansible-lint' 'python-lxml')
license=('BSD')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('7ac309572a7d2fdb7e204e4ba8b6f77898a2fab5efe46f65fd1ae9cf6f0e36f2')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

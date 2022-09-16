# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='ansible-lint-junit'
pkgname="python-${pkgbase}"
pkgver='0.17.7'
pkgrel='1'
pkgdesc='ansible-lint to JUnit converter'
arch=('any')
url="https://github.com/wasilak/${pkgbase}"
makedepends=('python' 'python-setuptools' 'python-lxml')
depends=('ansible-lint' 'python-lxml')
license=('BSD')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c887fc2fbe9406967f60544071d26d81c425f2fab79b97bf72ba77ba456df578')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Contributor: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=python2-junit-xml
pkgver=1.9
pkgrel=1
pkgdesc='Creates JUnit XML test result documents that can be read by tools such as Jenkins.'
arch=('any')
url="https://github.com/kyrus/python-junit-xml"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v1.9.tar.gz")
sha256sums=('eaa679cafff29e8ac447b5e1e6351f3917d3802703fffcdba628ab1fb0b8bfbd')
makedepends=('python2-setuptools')
depends=('python2' 'python2-six')

package() {
  cd "python-junit-xml-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

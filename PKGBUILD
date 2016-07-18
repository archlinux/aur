# PyPuppetDB: Installer: Arch
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgbase=python-pypuppetdb
pkgname=('python2-pypuppetdb' 'python-pypuppetdb')
pkgver=0.2.3
pkgrel=1
arch=('any')
url='https://github.com/puppet-community/pypuppetdb'
license=('APACHE')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/puppet-community/pypuppetdb/archive/v${pkgver}.tar.gz")
sha512sums=('f1ce7d138d26c2bb65b64c2a03348e563fe56533a974c8d4c895a79700c87cdbab1d71e6609a784848a839c58ac1af393db6dc2e3d82f7a91172a1f487ad2273')

package_python2-pypuppetdb() {
  pkgdesc='Python library for working with the PuppetDB API (Python 2 version)'
  depends=('python2' 'python2-requests' 'python2-httpretty')
  cd "${srcdir}/pypuppetdb-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

package_python-pypuppetdb() {
  depends=('python' 'python-requests' 'python-httpretty')
  pkgdesc='Python library for working with the PuppetDB API (Python 3 version)'
  cd "${srcdir}/pypuppetdb-${pkgver}"
  python setup.py install --root=${pkgdir}/ --optimize=1
}
# vim:set ts=2 sw=2 et:


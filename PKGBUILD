# PyPuppetDB: Installer: Arch
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgbase=python-pypuppetdb
pkgname=('python2-pypuppetdb' 'python-pypuppetdb')
pkgver=0.2.2
pkgrel=1
arch=('any')
url='https://github.com/puppet-community/pypuppetdb'
license=('APACHE')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/puppet-community/pypuppetdb/archive/v${pkgver}.tar.gz")
sha512sums=('41e885cc4fa805ee2cc3ff13c752b033375c7a5aea0561681ec27eb190a9e3ce01fd5ff08c3f6993c072032e50df0fbee9bfe93099330bd65174fa6342675e1a')

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


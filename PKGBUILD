# PyPuppetDB: Installer: Arch
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgbase=python-pypuppetdb
pkgname=('python2-pypuppetdb' 'python-pypuppetdb')
pkgver=0.3.0
pkgrel=1
arch=('any')
url='https://github.com/puppet-community/pypuppetdb'
license=('APACHE')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/puppet-community/pypuppetdb/archive/v${pkgver}.tar.gz")
sha512sums=('795969ce1aebc6a75752f7d011c442ea1e96a7904eaed8b1041103df8738fa7c44062e3e9baee8ba8b8591bea50b4707735dd202b628025963a19b4674d4751e')

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


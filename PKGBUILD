# PyPuppetDB: Installer: Arch
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgbase=python-pypuppetdb
pkgname=('python2-pypuppetdb' 'python-pypuppetdb')
pkgver=0.3.1
pkgrel=1
arch=('any')
url='https://github.com/puppet-community/pypuppetdb'
license=('APACHE')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/puppet-community/pypuppetdb/archive/v${pkgver}.tar.gz")
sha512sums=('7ad85971c7582a20e7d357aff456f5ed63c31e887573e754cb818c21148a3997c6dd3e2287726bffd339f440535fb8bc9d3423ef86ea834f914b5a5d8f3fef59')

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


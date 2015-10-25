# PyPuppetDB: Installer: Arch
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgbase=python-pypuppetdb
pkgname=('python2-pypuppetdb' 'python-pypuppetdb')
pkgver=0.2.0
pkgrel=1
arch=('any')
url='https://github.com/puppet-community/pypuppetdb'
license=('APACHE')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/puppet-community/pypuppetdb/archive/v${pkgver}.tar.gz")
sha512sums=('0e6ba4443884ed698afc227b1cc4314e284dcfc4681bfb6e21464494a80ebb5803703158ef3b2cdc43ffb80e04c90e0c8861ce5f5d92616026b791393151b1e1')

package_python2-pypuppetdb() {
  pkgdesc='Python library for working with the PuppetDB API (Python 2 version)'
  depends=('python2')
  cd "${srcdir}/pypuppetdb-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}

package_python-pypuppetdb() {
  depends=('python')
  pkgdesc='Python library for working with the PuppetDB API (Python 3 version)'
  cd "${srcdir}/pypuppetdb-${pkgver}"
  python setup.py install --root=${pkgdir}/ --optimize=1
}
# vim:set ts=2 sw=2 et:


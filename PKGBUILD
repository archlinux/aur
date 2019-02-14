# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Milo Mirate <mmirate at gmx dot com>
pkgname=python-pgpdump
_pkgname=pgpdump
pkgver=1.5
pkgrel=1
pkgdesc="Python replacement for java.util.Properties."
arch=('any')
url="https://pypi.python.org/pypi/pgpdump"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1c4700857bf7ba735b08cfe4101aa3a4f5fd839657af249c17b2697c20829668')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pyspnego
_pkgname=pyspnego
pkgver=0.1.5
pkgrel=1
pkgdesc="Library to handle SPNEGO (Negotiate, NTLM, Kerberos) authentication."
url="https://pypi.org/project/pyspnego/"
arch=('any')
license=('MIT')
depends=('python' 'python-gssapi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c4bef557e8571bcac72bd982c1215106661953a138cc186d568cb3ca9b85aadd')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

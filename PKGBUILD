# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pyspnego
_pkgname=pyspnego
pkgver=0.1.3
pkgrel=1
pkgdesc="Library to handle SPNEGO (Negotiate, NTLM, Kerberos) authentication."
url="https://pypi.org/project/pyspnego/"
arch=('any')
license=('MIT')
depends=('python' 'python-gssapi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a2963d52b64ecd7df3f8e9a311a423e75bd4bcc5944d46da16837607f9f6e667')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

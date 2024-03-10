# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=3.20.0
pkgrel=1
pkgdesc='generates RFCs and IETF drafts from XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests python-platformdirs python-setuptools
	 python-pyflakes python-pycountry python-kitchen python-intervaltree
	 python-google-i18n-address python-html5lib python-six)
license=(LicenseRef-BSD-3-Clause)
source=("https://files.pythonhosted.org/packages/d2/1b/60ba1a6a9c7a02379b8cb3174254bf3092c74af5dbc1b9cbf73623729cc6/xml2rfc-3.20.0.tar.gz")
sha512sums=('bb819dcd0d5a01c6f7958fc2090823e9d204ef8b79bc63f447acd2e666f8f80bbdcb35245a4008f1a2f169888683899e286d9727928b14ea82802b5b522d082c')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}

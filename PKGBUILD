# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=2.37.3
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/a5/e4/a922123afff4564f4d81aebf8be55714749d483ec54d83ccb4818b7dbf10/xml2rfc-2.37.3.tar.gz")
sha512sums=('e19f89c7f03e73feb2d29f731aee1abc9ec6f6f0cba8ee1e001bbe9ba04b7bacfd9296a0a81e3ea63061af5fcf98d6df4f5cbb05a9a5b3f1262293a8e1024e31')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}

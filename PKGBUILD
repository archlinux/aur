# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=2.24.0
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/39/02/046571ee27ad899066b691b9943ba2bd52fa03f8ed109ec0205f237cab81/xml2rfc-2.24.0.tar.gz")
sha512sums=('9fcee3f7904d7f3e929d4c9a4048f739327dc75076e5896f232f08ae1d72eb9231dc21336620335c936024de2e1ca5521b1d132de428aa4c5b3c9868f524d43a')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}

# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xml2rfc
pkgver=2.39.0
pkgrel=1
pkgdesc='Generates RFCs and IETF drafts from document source in XML according to the DTD in RFC 2629'
url='https://pypi.python.org/pypi/xml2rfc'
arch=(any)
depends=(python python-lxml python-requests)
license=(custom:BSD)
source=("https://files.pythonhosted.org/packages/2f/39/9bc4535ca8fb1bd1b3b02d193d109943765d9f0611de578420ef5a101c10/xml2rfc-2.39.0.tar.gz")
sha512sums=('e19f89c7f03e73feb2d29f731aee1abc9ec6f6f0cba8ee1e001bbe9ba04b7bacfd9296a0a81e3ea63061af5fcf98d6df4f5cbb05a9a5b3f1262293a8e1024e31')
validpgpkeys=('89F8DCE7EAE72F530905C6524E9B574B8FBB171A') # Henrik Levkowetz <FIRSTNAME@SURNAME.com>

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/xml2rfc/LICENSE"
}
sha512sums=('e19f89c7f03e73feb2d29f731aee1abc9ec6f6f0cba8ee1e001bbe9ba04b7bacfd9296a0a81e3ea63061af5fcf98d6df4f5cbb05a9a5b3f1262293a8e1024e31')
sha512sums=('347c2e6256eaf6b6f6f9ab455fdbe72192755512f47f61d49f3de63acb90959f0a193f93a2befeb73843ea82c519368079d85de94091e613ead5017a70bfd9c3')

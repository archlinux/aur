# Contributor: xduugu
pkgname=ofxstatement
pkgver=0.7.1
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL')
depends=('python-appdirs>=1.3.0' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/$pkgver.tar.gz")
sha512sums=('e13f851df8a4c5a114921a8e49e3fd4a0612d02f21caba943b5fc332d33eb000da8b1443fc880b01c5458ce045598d47ada236da712591f21d8f85c615a10f58')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

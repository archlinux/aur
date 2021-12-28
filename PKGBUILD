# Contributor: xduugu
pkgname=ofxstatement
pkgver=0.8.0
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL')
depends=('python-appdirs>=1.3.0' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/$pkgver.tar.gz")
sha512sums=('eefdd8e2bf8f98f0c17bea1ea19dce38a5e103b7b5de5767e5ab1c8c46eac53287fe4b7a45b36b0cbb019bc04048b0982e53a05d37d05b84dd9ce27634a830a0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

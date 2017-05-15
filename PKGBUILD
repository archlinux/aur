# Contributor: xduugu
pkgname=ofxstatement
pkgver=0.6.1
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL')
depends=('python-appdirs>=1.3.0' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/$pkgver.tar.gz")
md5sums=('af6947a59dc672ce6bf8dfda3c91a34b')
sha512sums=('9db741f5ac337b5e42a627ad19cda26301f765a6efc8b1b8a8e1ed89b5b1a9269f42b052b1e29578ee72f2568ba1ee21a27fe33e2210af4f9881379233fef5c2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

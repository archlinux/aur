# Contributor: xduugu
pkgname=ofxstatement
pkgver=0.5.0
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL')
depends=('python-appdirs' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/0.5.0.tar.gz)
md5sums=('22dea873452c028a9804b022af0f4fbd')
sha256sums=('1c278bb7686adb8696d0758ee182f7fadb7bed4628ccc0ed77dafca55ad94289')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

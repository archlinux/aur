# Contributor: xduugu
pkgname=ofxstatement
pkgver=0.6.0
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL')
depends=('python-appdirs>=1.3.0' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/$pkgver.tar.gz")
md5sums=('c79c5068a92bfcd84316ebefaa707463')
sha256sums=('bdc8dcc02485b3e630b0d645828d6bef40afeb34799ef8f1acf41d965fd31795')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

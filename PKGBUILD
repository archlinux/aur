# Maintainer: juresu

pkgname=rajio-sen
pkgver=1.0.4
pkgrel=1
pkgdesc="A minimalist vaporwave-inspired pirate radio scanner for the terminal"
arch=('any')
url="https://github.com/jullespio/rajio-sen" 
license=('MIT')
depends=('python' 'python-requests' 'python-rich' 'python-pick')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ea8b4179bd96065fbceea08ced01c03f07b1686c64d7c57de6bc1b929985b8a')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

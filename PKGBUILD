# Maintainer: juresu

pkgname=rajio-sen
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimalist vaporwave-inspired pirate radio scanner for the terminal"
arch=('any')
url="https://github.com/jullespio/rajio-sen" 
license=('MIT')
depends=('python' 'python-requests' 'python-rich' 'python-zenlog')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c01ca6a818efcc52e00961531907e545333b846e1a31a54d3251339526fb45bc')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

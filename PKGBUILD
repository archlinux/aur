# Maintainer: Captain
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
sha256sums=('254061c851af970e66d042351f861ea957d082b80f990f4c39a9706e69de81cd')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

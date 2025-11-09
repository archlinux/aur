pkgname=phantomcollect
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight stealth web data collection framework for ethical security testing"
arch=('any')
url="https://github.com/xsser01/phantomcollect"
license=('MIT')
depends=('python')
source=("https://github.com/xsser01/phantomcollect/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

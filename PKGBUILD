
pkgname=python2-mistune
pkgver=0.8.4
pkgrel=6
pkgdesc="The fastest markdown parser in pure Python with renderer feature."
arch=('any')
url="https://github.com/lepture/mistune"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tgz::https://github.com/lepture/mistune/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('44f155966e135ae157a8769e566119d86d1cdae28a4c27ecb54c33a9497096d0d4284a98da0c1bd47195f1b5c83e293b9655a912431adb18bfe84766ba1adc15')

package() {
  cd "$srcdir/mistune-$pkgver"
  python2 setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

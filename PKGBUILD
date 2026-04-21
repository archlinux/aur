# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>
pkgname=xonigraf
pkgver=1.0.0
pkgrel=1
pkgdesc="Graficador matemático ligero para equipos de bajos recursos. Soporta sumatorias, series de Fourier y funciones complejas."
arch=('any')
url="https://github.com/XONIDU/xonigraf"
license=('MIT')
depends=('python' 'python-sympy' 'python-numpy' 'python-matplotlib' 'tk')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/xonigraf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 start.py "$pkgdir/usr/bin/$pkgname"
  install -Dm755 xonigraf.py "$pkgdir/usr/share/$pkgname/xonigraf.py"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 requirements.txt "$pkgdir/usr/share/doc/$pkgname/requirements.txt"
}
sha256sums=('ceea5b18482cbb7f649023300a4911c97acdc833eb7e4946d25d4bf338fce17a')

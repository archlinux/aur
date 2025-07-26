# Maintainer: Eshaan Desh eshaan2031@icloud.com
pkgname=fastnn
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to quickly access a prediction neural network model"
arch=('any')
url="https://github.com/eshnd/fastnn"
license=('MIT')
depends=('python' 'python-pytorch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4dd4e6c9516754e9e0e6b1d2f3f40472c6ea002b808f6fe2afc3f5ee00599a0332b6dc972e660d6fc7d863bc02fd6fe9a7295cf8835d464147ef01dac236a780')
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 fastnn.py "$pkgdir/usr/bin/fastnn"
}

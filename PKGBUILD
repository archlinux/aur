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
md5sums=('SKIP')
package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 fastnn.py "$pkgdir/usr/bin/fastnn"
}
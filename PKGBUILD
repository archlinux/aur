# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-ups-battery-status
pkgdesc="Monitor the status of your UPS battery in py3status bar"
pkgver=0.1.2
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-ups-battery-status"
source=("https://github.com/mcgillij/py3status-ups-battery-status/releases/download/0.1.2/py3status-ups-battery-status-0.1.2.tar.gz")
md5sums=('90559910f4dadd201192b08c468fd7b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 

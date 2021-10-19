# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-http-monitor
pkgdesc="Python module for py3status to monitor http services"
pkgver=0.1.3
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-http-monitor"
source=("https://github.com/mcgillij/py3status-http-monitor/releases/download/0.1.3/py3status-http-monitor-0.1.3.tar.gz")
md5sums=('781bf0e383ac3dd101e153a50447fb56')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

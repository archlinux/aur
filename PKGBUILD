# Maintainer: Jason McGillivray < mcgillivray dot jason at gmail dot com>


pkgname=py3status-cpu-governor
pkgdesc="Python module for py3status to keep track of your cpu governor state"
pkgver=0.1.2
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'py3status')
makedepends=('python-setuptools')
url="https://github.com/mcgillij/py3status-cpu-governor"
source=("https://github.com/mcgillij/py3status-cpu-governor/releases/download/0.1.2/py3status-cpu-governor-0.1.2.tar.gz")
md5sums=('f0e38dd215a7360c63eeb195db24ea60')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 

# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('dose')
pkgver=1.2.1
pkgrel=1
pkgdesc="Traffic light/signal/semaphore GUI for test driven development (TDD)"
arch=('any')
url='https://github.com/danilobellini/dose'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-watchdog' 'python-colorama' 'python-docutils'
         'python-wxpython')
options=(!emptydirs)
sha256sums=('72db407366d223782d0499d7f169599f191beb4afb5e6dc38c747dd09c471c63')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('dose')
pkgver=1.2.0
pkgrel=1
pkgdesc="Traffic light/signal/semaphore GUI for test driven development (TDD)"
arch=('any')
url='https://github.com/danilobellini/dose'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-watchdog' 'python-colorama' 'python-docutils'
         'python-wxpython')
options=(!emptydirs)
sha256sums=('59f0cdaec23c8f18a27637a5d7cb27e0142c5a8b7cfeb406f71b385d145fca14')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

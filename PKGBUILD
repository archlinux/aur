# Maintainer: gosella <gosella@gmail.com>

pkgname=('python-sysv-ipc' 'python2-sysv-ipc')
pkgver=0.7.0
pkgrel=1
pkgdesc='System V IPC primitives (semaphores, shared memory and message queues) for Python'
arch=('any')
url='http://semanchuk.com/philip/sysv_ipc/'
license=('BSD')
groups=()
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("http://semanchuk.com/philip/sysv_ipc/sysv_ipc-$pkgver.tar.gz")
sha1sums=('b4bab5a7f0687f0ec471249f3fe3395d2a68d3c8')

package_python-sysv-ipc() {
  depends=('python')

  cd "$srcdir/sysv_ipc-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-sysv-ipc() {
  depends=('python2')

  cd "$srcdir/sysv_ipc-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

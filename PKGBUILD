# Maintainer: Frank Motsch <frank@motschsoft.de>
pkgname=python2-posix_ipc
pkgver=1.0.0
pkgrel=1
pkgdesc="POSIX IPC primitives (semaphores, shared memory and message queues) for Python 2"
arch=('any')
url="http://semanchuk.com/philip/posix_ipc/"
license=('BSD')
groups=()
depends=('python2')
makedepends=('python-distribute')
options=(!emptydirs)
source=("http://semanchuk.com/philip/posix_ipc/posix_ipc-$pkgver.tar.gz")
md5sums=('85607a392087715ac3a3c7ded2492d06')

package() {
cd "$srcdir/posix_ipc-$pkgver"
python2 setup.py install --root="$pkgdir/" --optimize=1
}

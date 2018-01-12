# Maintainer: Frank Motsch <frank@motschsoft.de>
pkgname=python2-posix_ipc
pkgver=1.0.3
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
md5sums=('fff75c0fa6665c802dc26ce3736d9ba0')

package() {
cd "$srcdir/posix_ipc-$pkgver"
python2 setup.py install --root="$pkgdir/" --optimize=1
}

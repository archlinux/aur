# Maintainer: Frank Motsch <frank@motschsoft.de>
pkgname=python2-posix_ipc
pkgver=1.0.4
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
sha1sums=('93bb5606a626a7a43c990d9fe4ade3512b515685')

package() {
cd "$srcdir/posix_ipc-$pkgver"
python2 setup.py install --root="$pkgdir/" --optimize=1
}

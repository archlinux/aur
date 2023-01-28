# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.10
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python' 'python-pip')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6843f69fb24eaff6daa8eb110944a04587f9cf5e529b9711b93dcac7d82897e8')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	make install FLAGS=--no-deps DESTDIR="$pkgdir"
}

# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.1
pkgrel=2
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('49eec64f7809dae7c1aa33eba2145f073ed986af73db4b1cb6d9160b2913cf1e')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	make install DESTDIR="$pkgdir"
}

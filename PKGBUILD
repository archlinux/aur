# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.0.2
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('48aea9b930cb4a27558ea425b9166162efde467bfc0b6300ebc954303131c3f5')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	make install DESTDIR="$pkgdir"
}

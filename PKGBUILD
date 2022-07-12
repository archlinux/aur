# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.2.0
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('444c66c1f0c3569868ec6ae0ede035d541aaaee5ef7b39bff4b9aa3e7ba42d30')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	make install DESTDIR="$pkgdir"
}

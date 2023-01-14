# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.7
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python-pip')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fcadd578bf7972c57e578a44281232ff08de5f9610baeb2cc0ea008500e46652')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	make install FLAGS=--no-deps DESTDIR="$pkgdir"
}

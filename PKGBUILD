# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.9
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python' 'python-pip')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7ee0bfb0ea873ffc79f292ccbeb15f25e907747544c958ddbf864f5edfc6f28b')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	make install FLAGS=--no-deps DESTDIR="$pkgdir"
}

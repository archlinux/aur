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
sha256sums=('c9a7f28c5a47e205dd1b0618e8870c68e5dc64437778cebef14509dc675ecc94')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	make install FLAGS=--no-deps DESTDIR="$pkgdir"
}

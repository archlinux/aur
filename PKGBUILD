# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.11
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python' 'python-pip')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('dee41cddc0a0ef7ffc54b4c3fbba6286e631a2cda1d743c3fd8281dd37b1cda8')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	
	make install FLAGS=--no-deps DESTDIR="$pkgdir"
}

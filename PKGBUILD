# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.6
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
makedepends=('python-pip')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9804d129ad861e9bc67d2615bfc42f0a29f05c086f844cbae723848a592b385a')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"

	make install DESTDIR="$pkgdir"
}

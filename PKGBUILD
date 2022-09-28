# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.1.4
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle' 'python-pillow' 'python-qrcode')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('25e8fd33b4d48cd58290f56fbe82136c4475e217efa4ab58b481dcbfdf70a18b')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	make install DESTDIR="$pkgdir"
}

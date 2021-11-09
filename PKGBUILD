# Maintainer: patri9ck <patri9ck@gmail.com>
pkgname=a2ln
pkgver=1.0.1
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('633de3c773f519b28bb47c40d624d480c4aa275018d4b997247075ca03f96f6f')

package() {
	cd "$srcdir/a2ln-server-$pkgver/"
	make install DESTDIR="$pkgdir"
}

# Maintainer: Your Name <youremail@domain.com>
pkgname=a2ln
pkgver=1.0.0
pkgrel=1
pkgdesc="Android 2 Linux Notifications Server"
arch=('any')
url="https://github.com/patri9ck/a2ln-server"
license=('GPL3')
depends=('python' 'python-pyzmq' 'python-gobject' 'python-setproctitle')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c16385d2eeb4ee550733b2ecafadaac7054d6992c1d8178b27ca13c4811fbdf3')

package() {
	install -Dm755 "$srcdir/a2ln-server-$pkgver/a2ln" "$pkgdir/usr/bin/a2ln"
}

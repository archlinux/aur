# Author: Chrome Developer Relations

_npmname=yo

pkgname=nodejs-yeoman
pkgver=1.8.5
pkgrel=2
pkgdesc="Command line interface for creating, building, maintaining, and shipping Yeoman projects."
arch=(any)
url="http://yeoman.io"
license=('BSD')
depends=('npm' 'curl' 'git')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('9c184f88a9444192577a95bbf6beb043b6a9ae82f7fe052b293693f2a8e250bd')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
	chmod -R go-w "$pkgdir"/usr
}

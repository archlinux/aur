# Maintainer PKD paulkronlund@gmail.com
pkgname=google-drive-linux
pkgver=1.0
pkgrel=1
pkgdesc="An unoficial port of google drive to linux"
arch=('x86_64')
url="https://github.com/PKD667/google-drive-linux"
license=('MIT')
source=('google-drive-linux::git+https://github.com/PKD667/google-drive-linux')
makedepends=('git')
package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir/" sh install.sh
}
sha256sums=('SKIP')

pkgname='fs'
pkgver=0.9.9
pkgrel=0
pkgdesc="a Simple CLI tool to show file and directory sizes"
arch=('any')
url="https://github.com/Wael0dfg/fs"
license=('custom')
depends=('python')

install=
changelog=
sha256sums=('SKIP')
source=("$pkgname::git+https://github.com/Wael0dfg/fs.git")

build() {
	cd "$srcdir/$pkgname"
}

package() {
	# This ensures we are in the cloned repository folder ($srcdir/fs)
	cd "$srcdir/$pkgname"
	
	# Now, ./fs.py is a valid path from the current directory
	install -Dm755 ./fs.py "$pkgdir/usr/bin/fs"
}

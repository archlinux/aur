pkgname='fs'
pkgver=1.0.0
pkgrel=1
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
	cd "$srcdir/$pkgname"
	install -Dm755 ./fs.py "$pkgdir/usr/bin/fs"
}

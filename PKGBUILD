pkgname='fs'
pkgver=0.9.6
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

package() {
	cd "~/.cache/yay/$pkgname/src/$pkgname/"
	install -Dm755 ./fs.py "$pkgdir/usr/bin/fs"
}

pkgname='fs'
pkgver=0.9.8
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
	cd "~/.cache/yay/fs/fs.py"
	install -Dm755 ./fs.py "$pkgdir/usr/bin/fs"
}

pkgname='fs'
pkgver=0.5
pkgrel=0
pkgdesc="a Simple CLI tool to show file and directory sizes (Python script)"
arch=('any')
url="https://github.com/Wael0dfg/fs"
license=('custom')
depends=('python')

install=
changelog=
source=("https://raw.githubusercontent.com/Wael0dfg/fs/main/fs.py")
sha256sums=('SKIP')

package() {
	install -Dm755 "$srcdir/fs.py" "$pkgdir/usr/bin/fs"
}

# Maintainer: Vanya A. Sergeev <v@sergeev.io>
pkgname=ssterm
pkgver=3.0.0
pkgrel=2
pkgdesc="A simple console-based serial port terminal"
arch=('any')
url="https://github.com/vsergeev/ssterm"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+https://github.com/vsergeev/ssterm.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	install -D -m 0755 ssterm.py "$pkgdir/usr/bin/ssterm"
	install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

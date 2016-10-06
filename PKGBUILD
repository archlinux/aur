# Maintainer: Vanya A. Sergeev <v@sergeev.io>
pkgname=rigexpert-tool
pkgver=1.0.0
pkgrel=1
pkgdesc="Dump, plot, and convert impedance sweeps from a RigExpert antenna analyzer"
arch=('any')
url="https://github.com/vsergeev/rigexpert-tool"
license=('MIT')
depends=('python-pyserial' 'python-matplotlib' 'python-scipy')
source=("git+https://github.com/vsergeev/rigexpert-tool.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
	cd "$pkgname"
	install -D -m 0755 rigexpert_tool.py "$pkgdir/usr/bin/rigexpert-tool"
	install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

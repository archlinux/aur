# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")

sha256sums=('0c37b4fb5b282b85456479f64c495fa1c92484920755ba839656b36c3e31255f')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

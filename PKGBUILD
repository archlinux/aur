# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")

sha256sums=('01b33c0f39247e92e8b2aeedd8ce899bf4a923cfb2b4aa6bfeb777dc8da789e6')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

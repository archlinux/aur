# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")

sha256sums=('3ff574abe0876d59b76dea43355f81c1efcdec855769e9b5be9e79a32110ca2e')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

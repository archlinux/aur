# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source_x86_64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")
sha256sums_x86_64=('d2a3f6847664712bfeddc50f4b7d3c20c62e8ce5760a9541c793e09d62c5fcff')

source_aarch64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-aarch64.tar.gz")
sha256sums_aarch64=('742795dfd0e945c4df419f9706081395bce1cf55662f71353a5c4de92e754ada')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

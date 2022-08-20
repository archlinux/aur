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
sha256sums_x86_64=('72fcc001587b6a6752029bf14f3705c00a1b02e3ac75976fb6b7399f17bef2fa')

source_aarch64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-aarch64.tar.gz")
sha256sums_aarch64=('78ad64d765a85846febafce1e5c909dc14a71688574851b4b90b176e46020536')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

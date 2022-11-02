# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Run multiple commands in parallel"
# arch=('x86_64' 'aarch64')
arch=('x86_64')
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source_x86_64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")
sha256sums_x86_64=('c0e7380cf911d270da9c06ba634449dc16e257a423032f324cc240e538ba614c')

# source_aarch64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-aarch64.tar.gz")
# sha256sums_aarch64=('78ad64d765a85846febafce1e5c909dc14a71688574851b4b90b176e46020536')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

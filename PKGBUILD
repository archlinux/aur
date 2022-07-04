# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source_x86_64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")
sha256sums_x86_64=('9535b228bbc5df216de811686e6b8a253a1d3edd8685863ccad9b46a2c5ca941')

source_aarch64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-aarch64.tar.gz")
sha256sums_aarch64=('eb935e893da767e34c498e04b544621db5fc22d42b2236783cd1ed70bc9fc4ef')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

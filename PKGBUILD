# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source_x86_64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")
sha256sums_x86_64=('3ff574abe0876d59b76dea43355f81c1efcdec855769e9b5be9e79a32110ca2e')

source_aarch64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-aarch64.tar.gz")
sha256sums_aarch64=('f7b941b7e394e3603aa19b54ff53dc22999f9a22f287c89ef8286f4a7c4bb951')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

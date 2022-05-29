# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")

sha256sums=('57282931026028680fea4d379fa60e6e3fcba9ccb3e80c7fd92effc776dbf2d0')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

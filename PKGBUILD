# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")

sha256sums=('db961747ce49217133a73ad1d9efc994d5c7a32b422eb1cb010e43790db4a0ae')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

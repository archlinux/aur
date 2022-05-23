# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")

sha256sums=('cce9fff1450cde0ede0690888da0094b70661bf4770f2c0525893aead0b7e15a')

package() {
	install -D -m755 $srcdir/mprocs-${pkgver}-linux64/mprocs $pkgdir/usr/bin/mprocs
}

# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=('x86_64' 'aarch64')
url="https://github.com/pvolok/mprocs"
license=('MIT')

conflicts=('mprocs')
provides=('mprocs')

source_x86_64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-linux64.tar.gz")
sha256sums_x86_64=('9c4778a21b3322729ae9e62e832c2fa55a6ddf8013d65fb4fb6167bdc26511da')

source_aarch64=("https://github.com/pvolok/mprocs/releases/download/v${pkgver}/mprocs-${pkgver}-aarch64.tar.gz")
sha256sums_aarch64=('7f060d7ddcd2460acd23028c4c219275a51c94a072abb4dfdba2a39a70fa805e')

package() {
	install -D -m755 $srcdir/mprocs $pkgdir/usr/bin/mprocs
}

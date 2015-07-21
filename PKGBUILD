# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=fincore
pkgver=1.9
pkgrel=2
pkgdesc="File IN CORE: show which blocks of a file are in core"
arch=(any)
url="http://net.doit.wisc.edu/~plonka/fincore"
license=('GPL')
depends=('perl-inline-c')
makedepends=()
conflicts=()
source=($url/fincore)
md5sums=(4d5f603189b0b552c5e792666cc8e289)

package() {
    cd ${srcdir}/
    install -D -m755 fincore ${pkgdir}/usr/bin/fincore
}

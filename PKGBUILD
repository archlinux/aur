# Maintainer: Nate Bragg <nate [at] cs.tufts.edu>
# Maintainer: Chris Pacejo <chris [at] pacejo.net>
pkgname=snam
pkgver=0.1
pkgrel=0
pkgdesc="SNAM cursor positioning system"
arch=("x86_64" "arm")
depends=()
url="http://chris.pacejo.net/programs/snam"
license=('UNLICENSED')
source=("https://hub.darcs.net/squirrel/snam/dist")
sha512sums=("SKIP")

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make
    mkdir -p $pkgdir/usr/bin/
    cp snam $pkgdir/usr/bin/
}

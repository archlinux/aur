# Maintainer: Rein Fernhout <me@levitati dot ng>
pkgname=rscw
pkgver=0.1e
pkgrel=1
pkgdesc="RSCW: receive CW through the soundcard"
url="http://www.pa3fwm.nl/software/rscw/"
arch=(x86_64)
depends=(gtk2 gcc)
source=("$pkgname-$pkgver.tgz")
sha256sums=('6246ac8557b2f1ba85e7ecd7b8838718b117f18b2d06e549c836cac270edbcc3')

build() {
	make
}

package() {
	install -Dvm755 rscw rscwx noisycw rs12tlmdec -t "$pkgdir/usr/bin"
}

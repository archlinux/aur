# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=dive-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A tool for exploring each layer in a docker image"
arch=(x86_64)
url="https://github.com/wagoodman/dive"
license=('MIT')

source=("https://github.com/wagoodman/dive/releases/download/v${pkgver}/dive_${pkgver}_linux_amd64.tar.gz")

sha256sums=('9541997876d4985de66d0fa5924dac72258a3094ef7d3f6ef5fa5dcf6f6a47ad')

package() {
	# package
	install -D -m755 $srcdir/dive $pkgdir/usr/bin/dive
}

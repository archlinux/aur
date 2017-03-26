# PKGBUILD for xgraph from http://www.xgraph.org/
# Maintainer: ThanosApostolou <thanosapostolou@outlook.com>]

pkgname=xgraph-bin
pkgver=4.30
pkgrel=1
pkgdesc="XGRAPH is a general purpose x-y data plotter with interactive buttons for panning, zooming, printing, and selecting display options."
arch=('i686' 'x86_64')
url="http://www.xgraph.org/"
license=('custom')
depends=('libx11')
optdepends=('netpbm')
conflicts=('xgraph')
source=()
source_i686=("http://www.xgraph.org/linux/xgraph_4.30_linux32.tar.gz")
source_x86_64=("http://www.xgraph.org/linux/xgraph_4.30_linux64.tar.gz")

package() {
	cd "$pkgdir"
	mkdir -p "$pkgdir/usr/bin/"
	if test "$CARCH" == x86_64; then
		install -m 755 "$srcdir"/XGraph4.30_linux64/bin/xgraph "$pkgdir/usr/bin/"
	elif test "$CARCH" == i686; then
		install -m 755 "$srcdir"/XGraph4.30_linux32/bin/xgraph "$pkgdir/usr/bin/"
	fi
}
md5sums_i686=('14e0f03d18451ce2e6c2d5cdb25227af')
md5sums_x86_64=('976827671b1c0ebbdb2092d1b1e71aac')

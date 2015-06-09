# Maintainer: Manuel Mendez <mmendez534@gmail.com>
pkgname=gplot
pkgver=1.11
pkgrel=1
epoch=
pkgdesc="Simple perl wrapper for gnuplot"
arch=(any)
url="http://gplot.sourceforge.net"
license=('GPLv2')
groups=()
depends=('gnuplot>=4.4' 'perl')
source=($pkgname-$pkgver.tar.gz::http://sourceforge.net/projects/gplot/files/gplot/gplot-$pkgver.tar.gz/download)
sha1sums=('01e6c85847cb1c088a402a8ba71b88db8fca305f')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	echo pkgdir=$pkgdir
	install -m755 -D gplot.pl "$pkgdir/usr/bin/gplot.pl"
}

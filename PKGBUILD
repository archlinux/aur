# Maintainer: Joshua Hardy joshinsilico@gmail.com
pkgname=xdsstat
pkgver=20161203
pkgrel=1
pkgdesc="Prints various statistics for X-ray Detector Software output."
arch=(x86_64)
url="http://strucbio.biologie.uni-konstanz.de/xdswiki/index.php/Xdsstat"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('xds')
makedepends=('')
optdepends=('xdsgui')
source=("ftp://turn5.biologie.uni-konstanz.de/pub/$pkgname-linux64.bz2")
md5sums=('ddf18f58aa191dec91e112dc14982b36')
package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin
	install -D -m755 "${srcdir}"/$pkgname-linux64 "${pkgdir}"/usr/bin/$pkgname
}

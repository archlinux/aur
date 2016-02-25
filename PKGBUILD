# Maintainer: Joshua Hardy joshinsilico
pkgname=xdsstat
pkgver=1
pkgrel=1
pkgdesc="Prints various statistics for X-ray Detector Software output."
arch=(x86_64)
url="http://strucbio.biologie.uni-konstanz.de/xdswiki/index.php/Xdsstat"
license=('CCPL:cc-by-nc-nd-3.0')
depends=('xds')
makedepends=('')
optdepends=('xdsgui')
source=("ftp://turn5.biologie.uni-konstanz.de/pub/$pkgname-linux64.bz2")
md5sums=('1ec627befe30e5d07b7e487e4a9bbf40')
package() {
	install -d "${pkgdir}"/usr "${pkgdir}"/usr/bin
	install -D -m755 "${srcdir}"/$pkgname-linux64 "${pkgdir}"/usr/bin/$pkgname
}

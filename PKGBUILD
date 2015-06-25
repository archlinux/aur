# Contributor: SubNeX
# Contributor: Estuera ( modified to i386)
# Maintainer: Alexandru Ianu (Ayceman) <alexandru@manjaro.org>

pkgname=cnijfilter-common-i386
pkgver=3.40
pkgrel=2
pkgdesc="Canon IJ Printer Driver (Common package) i386"
url="http://support-au.canon.com.au/contents/AU/EN/0100300801.html"
arch=('i686')
license=('custom')
depends=('libcups' 'popt')
source=("https://www.dropbox.com/s/wnfwkbuvx024agh/cnijfilter-common-3.40-1.i386.tar.gz")
conflicts=('cnijfilter-common')
md5sums=('c4680f87933d109f7a5139701ae6af27')

package(){
	cp -a "$srcdir/usr" "$pkgdir"
}

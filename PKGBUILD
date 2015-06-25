# Contributor: Edwin Peters
# Modified to i386 by Jonas Steur
# Maintainer: Alexandru Ianu (Ayceman) <alexandru@manjaro.org>

pkgname=cnijfilter-mp495-i386
pkgver=3.40
pkgrel=2
pkgdesc="Canon IJ Printer Driver (MP495) i386"
url="http://support-au.canon.com.au/contents/AU/EN/0100300801.html"
arch=('i686')
license=('custom')
depends=('libcups' 'popt' 'cnijfilter-common-i386' 'libpng12' 'heimdal-aur' 'ghostscript' 'libtiff')
source=("https://www.dropbox.com/s/131lsa60kuvtmc0/cnijfilter-mp495series-3.40-1.i386.tar.gz")
md5sums=('aee21de0edddc8e36a460dab28064b70')

package(){
	cp -a "$srcdir/usr" "$pkgdir"
}


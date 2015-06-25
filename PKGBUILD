# Contributor: Edwin Peters
# Maintainer: Alexandru Ianu (Ayceman) <alexandru@manjaro.org>

pkgname=cnijfilter-mp495-x86_64
pkgver=3.40
pkgrel=2
pkgdesc="Canon IJ Printer Driver (MP495) x86_64"
url="http://support-au.canon.com.au/contents/AU/EN/0100300801.html"
arch=('x86_64')
license=('custom')
depends=('libcups' 'popt' 'cnijfilter-common-x86_64' 'libpng12' 'heimdal-aur' 'ghostscript' 'libtiff')
source=("https://www.dropbox.com/s/hg5tpyeyj39ybpj/cnijfilter-mp495series-3.40-1.x86_64.tar.gz")
md5sums=('628db74d6780d9a3f5e6445e3cc195d9')

package(){
	cp -a "$srcdir/usr" "$pkgdir"
}

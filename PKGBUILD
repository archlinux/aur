# Maintainer: sdvcrx <memory.silentvoyage@gmail.com>
# Contributor: E478 <wyy1326[at]gmail[dot]com>

pkgname=gbkunzip
pkgver=0.2
pkgrel=6
pkgdesc="Extract zip files with encoding GBK instead of UTF-8"
arch=('any')
url='http://lilydjwg.is-programmer.com/posts/16293.html'
license=('unknown')
depends=('python3')
source=('https://blog.lilydjwg.me/user_files/lilydjwg/File/gbkunzip.tar.bz2')
md5sums=('492e2794338da165a2b950829fd9548e')

package() {
	cd ${srcdir}
	path1="${pkgdir}/usr/bin"
	path2="${pkgdir}/usr/lib/python`python3 -V 2>&1 | cut -c 8-10`/site-packages"
	mkdir -p ${path1} ${path2}
	install -D -m755 gbkunzip ${path1}
	install -D -m755 gbzip.py ${path2}
}

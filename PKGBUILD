# Maintainer: sdvcrx <memory.silentvoyage@gmail.com>
# Contributor: E478 <wyy1326[at]gmail[dot]com>

pkgname=gbkunzip
pkgver=0.2
pkgrel=7
pkgdesc="Extract zip files with encoding GBK instead of UTF-8"
arch=('any')
url='http://lilydjwg.is-programmer.com/posts/16293.html'
license=('unknown')
depends=('python3')
source=('https://blog.lilydjwg.me/user_files/lilydjwg/File/gbkunzip.tar.bz2')
sha256sums=('c4658d19f293fe000f5133ee2016cb929403d0a6a4141c33d37012aabee4e5fe')

package() {
	cd ${srcdir}
	path1="${pkgdir}/usr/bin"
	path2="${pkgdir}/usr/lib/python`python3 -V 2>&1 | cut -d ' ' -f 2 | cut -d . -f 1,2`/site-packages"
	mkdir -p ${path1} ${path2}
	install -D -m755 gbkunzip ${path1}
	install -D -m755 gbzip.py ${path2}
}

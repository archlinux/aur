# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=xcursor-neutral++
pkgver=1.0.3
pkgrel=2
pkgdesc="Icon set based on Neutral and jaguarx themes."
arch=('any')
url="https://dl.opendesktop.org/api/files/download/id/1460735294/108142-Neutral++-$pkgver.tar.xz"
license=('Artistic 2.0')
source=(https://dl.opendesktop.org/api/files/download/id/1460735294/s/5ce93eb392694040136bff1805802bc7/t/1539154277/u//108142-Neutral%20%20-1.0.3.tar.xz)
sha256sums=('23ec4fa3f7b62c023b8726b70d7a822ecd1f3cf90515b302d988f6fe58bce426')

build() {
	true
	}

package(){
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r Neutral++ $pkgdir/usr/share/icons
	}

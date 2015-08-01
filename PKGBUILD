# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=xcursor-neutral++
pkgver=1.0.3
pkgrel=1
pkgdesc="Icon set based on Neutral and jaguarx themes."
arch=('any')
url="http://gnome-look.org/content/show.php/Neutral%2B%2B?content=108142"
license=('Artistic 2.0')
source=(http://gnome-look.org/CONTENT/content-files/108142-Neutral++-$pkgver.tar.xz)
sha256sums=('23ec4fa3f7b62c023b8726b70d7a822ecd1f3cf90515b302d988f6fe58bce426')

build() {
	true
	}

package(){
	cd $srcdir
	mkdir -p $pkgdir/usr/share/icons
	cp -r Neutral++ $pkgdir/usr/share/icons
	}

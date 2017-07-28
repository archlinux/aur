# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=stl-thumbnailer
pkgver=1
pkgrel=1
pkgdesc="Allow file managers (nautilus,caja etc) to geterate thumbnails for stl files using openscad"
arch=('any')
url="https://www.thingiverse.com/thing:258653"
license=('GPL')
groups=()
depends=(openscad python2)
makedepends=()
source=("stl.thumbnailer"
        "stl.thumbnailer.py")
md5sums=('2e86d05c56f013b5030caf6e5b03a856'
         '7e1cfa75271e806ef339f1bb3f62b8dc')

package() {
	cd ${srcdir}
	install -D -m 755 stl.thumbnailer.py ${pkgdir}/usr/bin/stl.thumbnailer.py
	install -D -m 644 stl.thumbnailer ${pkgdir}/usr/share/thumbnailers/stl.thumbnailer
}


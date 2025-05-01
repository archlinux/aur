pkgname=libxml2-compat
pkgver=1
pkgrel=1
pkgdesc="Makes /usr/lib/libxml2.so.2 reappear"
arch=('any')
url="https://gitlab.gnome.org/GNOME/libxml2/-/issues/901"
depends=('libxml2')
source=()
package() {
	mkdir -p "${pkgdir}/usr/lib"
	ln -s libxml2.so "${pkgdir}/usr/lib/libxml2.so.2"
}

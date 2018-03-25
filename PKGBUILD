# Contributor: Diejmon <diejmon at gmail _dot_com>
pkgname=gtk-clearlooks-compact
pkgver=1.5
pkgrel=2
pkgdesc="Theme for Clearlooks GTK+ engine"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Clearlooks+Compact?content=69357"
license=('GPL')
depends=('gtk-engines')
source=('http://martin.ankerl.com/files/2007/11/ClearlooksCompact-1.5.tar.bz2')
md5sums=('9d6f111db273f065cfd2e3ee5c390eac')
 
build() {
	cd ${srcdir}
	ln -s 'Clearlooks Compact' ${pkgname}-${pkgver}
	}
package(){
	mkdir -p ${pkgdir}/usr/share/themes/Clearlooks\ Compact
	cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/themes/Clearlooks\ Compact
	}

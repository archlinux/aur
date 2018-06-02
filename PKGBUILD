# Maintainer: Erik Dubois - erik.dubois@gmail.com

pkgname=oxy-neon
pkgver=0
pkgrel=2
pkgdesc="Stylized oxygen mouse theme created for use with dark desktop and especially for FRUiT's Neon suite. "
arch=('any')
url="https://www.gnome-look.org/p/999997/"
license=('GPL3')
source=("137109-${pkgname}-${pkgver}.${pkgrel}.tar.gz::https://github.com/erikdubois/gnome-look/raw/master/137109-${pkgname}-${pkgver}.${pkgrel}.tar.gz")
md5sums=('c8dc8489fbb25935b84c7a4b1bfcc5e4')         
sha256sums=('4ef320165c749d1f9953e852eb69d74f0bf3eb9bab728dc230fb7565570d5655')

package() {
	cd "$pkgname"
	install -dm755 "$pkgdir/usr/share/icons/oxy-neon"
	cp -r * "$pkgdir/usr/share/icons/oxy-neon"
}

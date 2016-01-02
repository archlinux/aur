pkgname=d2clr-git
pkgver=2016.01.02
pkgrel=1
pkgdesc="Auto click button 'Accept' in Dota 2 game"
url="https://gitlab.com/Pampa/d2clrd.git"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('glibc' 'dbus' 'xdotool')

package() {
	cd "$srcdir"
	rm -r "$pkgname"
	git clone "$url" "$pkgname"
	cd "$pkgname"
	make install PREFIX="${pkgdir}/usr"
}


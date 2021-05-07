# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>

pkgname=libbit4opki
pkgver=1.3.3.2
pkgrel=1
pkgdesc="Bit4ID Oberthur Middleware (Smart Card driver)"
arch=("i686" "x86_64")
license=("unknown")
url="http://www.bit4id.com/"
install=$pkgname.install
options=("!strip")
depends=('ccid' 'opensc')

ARCH="amd64"
md5sums=("ff9dc26f53f60dd324c842754cd31b3e")

_file_name="$pkgname-$ARCH.deb"
source=("https://www.cmcps.it/images/$_file_name")

package() {
	ar -xv $_file_name || return 1
	tar -xvf data.tar.[xg]z -C "$pkgdir" || return 1
}

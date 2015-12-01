# Maintainer: M0Rf30

pkgname=pkcs11-game-fix
_pkgname=gnome-keyring
pkgver=3.18.3
pkgrel=1
pkgdesc="GNOME Password Management library for Heroes of The Storm"
arch=('x86_64')
url="http://www.gnome.org"
license=('GPL' 'LGPL')
depends=()
options=('!makeflags')
source=(http://arch.localmsp.org/arch/extra/os/i686/${_pkgname}-1:$pkgver-$pkgrel-i686.pkg.tar.xz)

package() {
	cd $srcdir
	install -Dm755 usr/lib/pkcs11/gnome-keyring-pkcs11.so $pkgdir/usr/lib32/pkcs11/gnome-keyring-pkcs11.so
}

md5sums=('0cb670995cdf64124a6f4663010e1d0a')

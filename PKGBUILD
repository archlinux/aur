# Maintainer: Oliver Kuster <olivervbk@gmail.com>
pkgname=mfastboot
pkgver=2.0.0
pkgrel=1
pkgdesc="Motorola Fastboot"
arch=('i686' 'x86_64')
url="http://forum.xda-developers.com/moto-g/general/install-brazil-5-0-ota-xt1033-t2963800"
license=('custom')
depends=()
makedepends=('unzip')
checkdepends=()
provides=('mfastboot')
conflicts=('mfastboot')
options=()
source=("http://forum.xda-developers.com/attachment.php?attachmentid=2427667")
md5sums=('590734d743cc9bf0e6a301246e036974')

package() {
	USR_BIN_PREFIX="$pkgdir/usr/bin"
	MFASTBOOT_BIN="$USR_BIN_PREFIX/mfastboot"
	mkdir -p "$USR_BIN_PREFIX" 
	mv "$srcdir/linux-fastboot" "$MFASTBOOT_BIN"
	chmod a+x "$MFASTBOOT_BIN"
}

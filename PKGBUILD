# Maintainer: M0Rf30

pkgname=mips-2011-mips-linux-gnu
pkgver=2011.03
pkgrel=1
pkgdesc="Sourcery G++ Lite 2011.03-95 for MIPS (target) GNU/Linux(target-kernel) "
arch=('i686' 'x86_64')
url="http://www.codesourcery.com/sgpp/lite/arm/portal/release1802"
#Custom license according to share/doc/arm-arm-none-eabi/LICENSE.txt
license=('custom')
options=(!strip)
source=(http://www.codesourcery.com/sgpp/lite/mips/portal/package9055/public/mips-linux-gnu/mips-2011.03-93-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2)


package() {
#Copy base binaries, libraries and such
	mkdir -p $pkgdir/usr
	cd $srcdir/mips-$pkgver
	cp -PR * $pkgdir/usr
}

md5sums=('8d8639a2aef4a79be1f63af635472f6e')


# Maintainer: ctag <bigbero@gmail.com>
pkgname=avr-libc-atmega328pb
pkgver=1.5.362
pkgrel=1
epoch=0
pkgdesc="Atmega328pb support for avr-libc"
arch=('any')
url="http://packs.download.atmel.com"
license=('Apache')
groups=()
depends=('avr-libc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Atmel.ATmega_DFP.${pkgver}.zip::http://packs.download.atmel.com/Atmel.ATmega_DFP.${pkgver}.atpack")
noextract=()
md5sums=('31f644ae9287a6ce9abd5e724f3d4661')
validpgpkeys=()

package() {
	install -D "${srcdir}/include/avr/iom328pb.h" -t "${pkgdir}/usr/avr/include/avr/"
	install -D "${srcdir}/gcc/dev/atmega328pb/avr5/crtatmega328pb.o" -t "${pkgdir}/usr/avr/lib/avr5/"
	install -D "${srcdir}/gcc/dev/atmega328pb/avr5/libatmega328pb.a" -t "${pkgdir}/usr/avr/lib/avr5/"
}

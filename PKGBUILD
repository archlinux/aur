# Maintainer: Samuel Dolt <samuel@dolt.ch>
pkgname=avr-libc-atmel-atmega328pb
pkgver=1.2.132
pkgrel=1
pkgdesc="Atmega328pb support for avr-libc-atmel"
arch=("any")
url="http://packs.download.atmel.com/"
license=("apache-2.0")
depends=("avr-libc-atmel")
options=(!strip)
source=("Atmel.ATmega_DFP.$pkgver.zip::http://packs.download.atmel.com/Atmel.ATmega_DFP.$pkgver.atpack")
sha1sums=("817b568e15b2bfdcd880515391360802707ea41a")


package() {
  install -Dm644 gcc/dev/atmega328pb/avr5/crtatmega328pb.o "$pkgdir/usr/avr/lib/avr5/crtatmega328pb.o"
  install -Dm644 gcc/dev/atmega328pb/avr5/libatmega328pb.a "$pkgdir/usr/avr/lib/avr5/libatmega328pb.a"
  install -Dm644 include/avr/iom328pb.h "$pkgdir/usr/avr/include/avr/iom328pb.h"
}

# Maintaner: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=lk4b
pkgver=20080706
pkgrel=1
pkgdesc="A small program which locks your keyboard but leaves your mouse free"
arch=('any')
url="http://csincock.customer.netspace.net.au/lock-keyboard-for-baby.htm"
license=('GPL')
depends=('gtk2-perl')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/lock-keyboard-for-baby-$pkgver.pl)
md5sums=('0498aaf7cd4adc34f6d7593b96282d85')

package() {
  cd "${srcdir}"

  sed -i 's|#!/bin/env perl|#!/usr/bin/env perl|g' lock-keyboard-for-baby-$pkgver.pl
  install -D -m755 "${srcdir}/lock-keyboard-for-baby-$pkgver.pl" "${pkgdir}/usr/bin/$pkgname"
}

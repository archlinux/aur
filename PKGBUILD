# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=flexbox-udev
pkgver=1.0
pkgrel=1
pkgdesc='Flexbox udev rules'
arch=('any')
url='https://flexbox.reconfigure.me/howto/guides.html#linux'
license=('custom')
source=('https://flexbox.reconfigure.me/howto/99-tprogrammer.rules')
b2sums=('e8e1e52ccc5d090f9dcd3a33ef6ab1a660372325b041853a2fe95e6d41dce772514073188a7fed2e70a8596dfc1e01cf64bf2be2829ccc33dc1cf9959a438759')

package() {
  install -Dm644 ${srcdir}/99-tprogrammer.rules ${pkgdir}/usr/lib/udev/rules.d/99-tprogrammer.rules
}

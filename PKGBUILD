# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=flexbox-udev
pkgver=1.0
pkgrel=1
pkgdesc='Flexbox udev rules'
arch=('any')
url='https://flexbox.reconfigure.me/howto/guides.html#linux'
license=('custom')
source=('https://flexbox.reconfigure.me/howto/99-tprogrammer.rules')
sha512sums=('9c60332fa8b319c109bb60cd9fb65249a8093185f7f9abfc8bbd3f77aa88edd12162f2ccffc1b630867169c472ac9d7b831ccceec0f9a4168834347a4a644cfb')

package() {
  install -Dm644 ${srcdir}/99-tprogrammer.rules ${pkgdir}/usr/lib/udev/rules.d/99-tprogrammer.rules
}

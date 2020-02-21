# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=flexbox-udev
pkgver=1.0
pkgrel=1
pkgdesc='Flexbox udev rules'
arch=('any')
url='https://flexbox.reconfigure.me/howto/guides.html#linux'
license=('custom')
source=('https://flexbox.reconfigure.me/howto/99-tprogrammer.rules')
sha512sums=('4b5971d2bf60a6f2df38ce4ea7ebe8a2680680176dd38328e272f059acc598cea01cb6ae4eff3ca68d380959ddae9bb9208e8e75f3d2f648a9dc8d6c5cdd0f32')

package() {
  install -Dm644 ${srcdir}/99-tprogrammer.rules ${pkgdir}/usr/lib/udev/rules.d/99-tprogrammer.rules
}

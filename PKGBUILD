# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=flexbox-udev
pkgver=1.0
pkgrel=1
pkgdesc='Flexbox udev rules'
arch=('any')
url='https://flexbox.reconfigure.me/howto/guides.html#linux'
license=('custom')
source=('https://www.flexoptix.net/skin/udev_rules/99-tprogrammer.rules')
b2sums=('6265d7825e291af97413750032d2f8dca052436931af1439486b7cc4b9d5957d11ba2d529f95f9eb82a9353077ed98779aa806367afd0fa14ca1b001866b215e')

package() {
  install -Dm644 "${srcdir}"/99-tprogrammer.rules "${pkgdir}"/usr/lib/udev/rules.d/99-tprogrammer.rules
}

# Maintainer: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8-tall
pkgver=1.0
pkgrel=1
pkgdesc="Double-height version of unscii8."
url="http://pelulamu.net/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://pelulamu.net/unscii/unscii-8-tall.otf")
sha512sums=('e9f9eed99ec4a38afa550866597c46200249fd6a48c337a6742d3b594c6024034a5b26928486b38f247ce6102c9e33a3e322d13d5b9538818b8fcfc4f0117e7c')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8-tall.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8-tall.otf"
}

# vim:set ts=2 sw=2 et:

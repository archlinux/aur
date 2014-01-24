# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fotaq-de
pkgver=1.0
pkgrel=1
pkgdesc='Graphical point-and-click adventure game (aka "Flight of the Amazon Queen") - german language'
arch=('any')
url="http://en.wikipedia.org/wiki/Flight_of_the_amazon_queen"
license=('custom')
depends=('scummvm')
source=("http://downloads.sourceforge.net/scummvm/FOTAQ_Ger_talkie-$pkgver.zip"
        "$pkgname.sh")
sha256sums=('6e2826993a94864c1dd3d299369cb320a119cede4be14bf3f59b0471fa20768f'
            'b3e96ec85fa668beb14e908e0a0df63ea9de4c05c31702f951a4438faf40535b')

package() {
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  # data
  install -Dm644 queen.1c "$pkgdir"/usr/share/$pkgname/queen.1c
  #license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

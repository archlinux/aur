# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=marble-maps-micromacro-crimecity-demo
pkgname="${_pkgname}"
epoch=0
pkgver=20220208.01
pkgrel=3
pkgdesc="Makes the map of the demo of the board game 'microMACRO Crime City' browsable in KDE marble. Select the celestial body 'MicroMacro'."
url="https://micromacro-game.com/en/democase.html"
arch=('any')
license=(
  'custom: Public Domain'
  'custom: Edition Spielwiese/ Pegasus Spiele.'
)
groups=()
depends=(
  'marble-common'
)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=('emptydirs')
source=(
  "micromacro-crimecity-demo.dgml"
  "preview.png::https://micromacro-game.com/img/map/2x/4/3/5.png"
  "base-tile.png::https://micromacro-game.com/img/map/2x/0/0/0.png"
  'COPYING.txt'
)
sha256sums=(
  '0b8614d5291888204a94743866b7188f35d931eedcacfde51e1c90ba197021e6'
  '50b4292f0757a9b4fc79c66beec7a629c1df38ae6c0514e16307eb6fa22af813'
  '1c205eb65162771ae06d472211ffe59b4be386030d1befa05eec9f6fb9758ce1'
  'be45b9d188a595fddbc4cd14e2cc96c3378d3dbaa17da3f57662d973ef4f62f0'
)

package() {
  cd "${srcdir}"

  install -v -D -m644 micromacro-crimecity-demo.dgml "${pkgdir}/usr/share/marble/data/maps/MicroMacro/micromacro-crimecity-demo/micromacro-crimecity-demo.dgml"
  install -v -D -m644 preview.png                    "${pkgdir}/usr/share/marble/data/maps/MicroMacro/micromacro-crimecity-demo/preview.png"
  install -v -D -m644 base-tile.png                  "${pkgdir}/usr/share/marble/data/maps/MicroMacro/micromacro-crimecity-demo/0/0/0.png"

  install -v -D -m644 "COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}

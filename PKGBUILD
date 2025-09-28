# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=teams-for-linux-school-profile
pkgver=latest
pkgrel=2
pkgdesc="A desktop entry for a separate school account for teams-for-linux"
arch=('x86_64')
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=('GPL3')
depends=('teams-for-linux')
makedepends=()
source=(
  "${pkgname}.desktop"
  "${pkgname}.png"
  "${pkgname}.sh"
)
sha256sums=('0dee3aa7f7898ad004804fb65e33fe44db0de57da4dc70f38a8780c8d3fe64b4'
            '5c69985e1913702251e8a299ee5d0e9fbda8130daeaf64aba507c3c8082cf286'
            '26f2afacaac2c7626e8b8421bee6fb9a9eeb9da651fe5d8c6994924742bb7375')

build() {
  :
}

package() {
  install -Dm755 "$pkgname.sh" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "${pkgname}.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

  install -Dm644 "${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

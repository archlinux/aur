# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=teams-for-linux-work-profile
pkgver=0.0.1
pkgrel=1
pkgdesc="A desktop entry for a separate work account for teams-for-linux"
arch=('x86_64')
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=('GPL3')
depends=('teams-for-linux')
makedepends=()
source=(
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha256sums=('SKIP' 'SKIP')

build() {
  :
}

package() {
  install -Dm644 "${pkgname}.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

  install -Dm644 "${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

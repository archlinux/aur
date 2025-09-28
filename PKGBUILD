# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=teams-for-linux-work-profile
pkgver=latest
pkgrel=2
pkgdesc="A desktop entry for a separate work account for teams-for-linux"
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
sha256sums=('15e2a65b02d68242393708854afcab5e5c844503e14674073fd124c835786729'
            '809d7b2c8c88c59f264ed62864c4c95d5700808a854a3ad9f545ec2bd3accbee'
            '90bbbb48d65ca4f038bf932e896376fed8494573456be28037e12138e4d9095b')

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

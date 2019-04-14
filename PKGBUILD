# Maintainer: Shayne Hartford <shayneehartford@gmail.com>
pkgname=realmofthemadgod
pkgver=X31.5.2
pkgrel=2
pkgdesc="A simple desktop entry for flashplayer-standalone that loads Realm of The Mad God"
arch=("x86_64")
url="https://www.realmofthemadgod.com/"
license=('unknown')
depends=('flashplayer-standalone')
source=(
    'realmofthemadgod.desktop'
    'realmofthemadgod.png'
)
sha256sums=(
    'b2c70c9a553494ac31705415d4ff54f196e44c8e73f9aa9618b3eafaff97c73c' '77d1081f7e3dedf1af3188f1df687347089115b15b05107fd06cbfc3811dab16'
)

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/realmofthemadgod.png"
}

# Maintainer: Shayne Hartford <shayneehartford@gmail.com>
pkgname=realmofthemadgod
pkgver=X31.1.2
pkgrel=1
pkgdesc="A simple desktop entry for flashplayer-standalone that loads Realm of The Mad God"
arch=("x86_64")
url="https://realmofthemadgod.com/"
license=('unknown')
depends=('flashplayer-standalone')
source=('realmofthemadgod.tar.gz')
sha256sums=('47ad1c673f36b73d1335458f7295c8216cd2611a6160e5661d5a0868f375bd76')

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# Maintainer: Shayne Hartford <shayneehartford@gmail.com>
pkgname=realmofthemadgod
pkgver=X31.5.2
pkgrel=1
pkgdesc="A simple desktop entry for flashplayer-standalone that loads Realm of The Mad God"
arch=("x86_64")
url="https://www.realmofthemadgod.com/"
license=('unknown')
depends=('flashplayer-standalone')
source=('realmofthemadgod.tar.gz')
sha256sums=('3d40dc280240793c42cfb15b77a0a74d398b8dac91287575e7e539127bfeaa55')

package() {
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# Maintainer: Kingkor Roy Tirtho <krtirho@gmail.com>
pkgname=wives-bin
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A Terminal that is as beautiful as your wife or probably better"
arch=(x86_64)
url="https://github.com/KRTirtho/wives"
license=('GPLv3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/KRTirtho/wives/releases/download/v${pkgver}/Wives-linux-x86_64.tar.xz")
noextract=()
md5sums=("739eb87b11fd8e99d115d8c6e01449db")
validpgpkeys=()

package() {
  install -dm755 "${pkgdir}/usr/share/icons/wives"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  mv ./wives.desktop "${pkgdir}/usr/share/applications"
  mv ./logo.png "${pkgdir}/usr/share/icons/wives/"
  cp -ra ./data ./lib ./wives "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/wives" "${pkgdir}/usr/bin/wives"
}

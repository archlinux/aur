# Maintainer: afward <archlinux.gargoyley@simplelogin.co>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yakyak-bin"
_pkgname=yakyak
pkgver=1.5.12
pkgrel=2
pkgdesc="Desktop chat client for Google Hangouts"
arch=('x86_64')
url="https://github.com/yakyak/yakyak"
license=('MIT')
optdepends=('noto-fonts-emoji: Emoji support')
provides=('yakyak')
conflicts=('yakyak')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}-rolling-beta/${_pkgname}-${pkgver}-beta-linux-x64-pacman.tar.gz")
sha256sums=('4b49ce5b110494928e72ae3bee99597920e71ff2a4343729f3eeca55cc8bea3a')

package() {
  cp --parents -a {opt,usr} "${pkgdir}"
}
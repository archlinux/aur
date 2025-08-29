# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.118.1
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('MIT')
source=("lobehub-desktop-beta_1.118.1_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.118.1_amd64.deb")
sha256sums=('94cd0274767695002f8f03e3b637f7c32cd551b5193f00f743b01c054f0ce3ae')

package() {
  cd "$pkgdir"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.118.1_amd64.deb" data.tar.xz | bsdtar -xJf -
}

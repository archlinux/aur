# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.122.6
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception ')
source=("lobehub-desktop-beta_1.122.6_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.122.6_amd64.deb")
sha256sums=('e81ece524f626be8d957803750ba6dcc97c0974473d1a2b96c77025636e9536b')

package() {
  cd "${pkgdir}"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.122.6_amd64.deb" data.tar.xz | bsdtar -xJf -
}

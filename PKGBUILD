# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.123.0
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception ')
source=("lobehub-desktop-beta_1.123.0_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.123.0_amd64.deb")
sha256sums=('33bd9805ce5efbc89e04b24374b273ffd8b93541210f52f4f4746239e736eed4')

package() {
  cd "${pkgdir}"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.123.0_amd64.deb" data.tar.xz | bsdtar -xJf -
}

# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.124.1
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception ')
source=("lobehub-desktop-beta_1.124.1_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.124.1_amd64.deb")
sha256sums=('b7ac84aac053c302807a71e9899f218f9bce2f98457e9e9fd6c7f72fab8e74d2')

package() {
  cd "${pkgdir}"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.124.1_amd64.deb" data.tar.xz | bsdtar -xJf -
}

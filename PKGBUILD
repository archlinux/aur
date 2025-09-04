# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.122.0
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception ')
source=("lobehub-desktop-beta_1.122.0_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.122.0_amd64.deb")
sha256sums=('9176df4b08b445ceba2cd1a89de762d6c1e9b4b3ab625cd1eb7d8d82d412c111')

package() {
  cd "${pkgdir}"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.122.0_amd64.deb" data.tar.xz | bsdtar -xJf -
}

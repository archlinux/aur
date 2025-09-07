# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.124.4
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception ')
source=("lobehub-desktop-beta_1.124.4_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.124.4_amd64.deb")
sha256sums=('9423de0c912f1c18a20804fc3be8970db741cee524ea113f8c332999829149e4')

package() {
  cd "${pkgdir}"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.124.4_amd64.deb" data.tar.xz | bsdtar -xJf -
}

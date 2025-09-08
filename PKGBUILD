# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.124.4
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception ')
makedepends=('rpmextract')
source=("lobehub-desktop-beta-1.124.4.x86_64.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-1.124.4.x86_64.rpm")
sha256sums=('c265a93542b3dafa631f32cafaa9f4d10fad273c2eb47c71636db60637dfe214')

package() {
  cd "${pkgdir}"
  rpmextract.sh "${srcdir}/lobehub-desktop-beta-1.124.4.x86_64.rpm"
}

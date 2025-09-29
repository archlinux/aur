# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.133.0
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception')
makedepends=('rpmextract')
source=("lobehub-desktop-beta-1.133.0.x86_64.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-1.133.0.x86_64.rpm")
sha256sums=('58bc06e8b7c277240adaac71e79622422f7b54855eb55e8f28e6d224a3ed88a9')

package() {
  cd "${pkgdir}"
  rpmextract.sh "${srcdir}/lobehub-desktop-beta-1.133.0.x86_64.rpm"
}

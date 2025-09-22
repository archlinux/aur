# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.132.4
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception')
makedepends=('rpmextract')
source=("lobehub-desktop-beta-1.132.4.x86_64.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-1.132.4.x86_64.rpm")
sha256sums=('6beec0e5cb18a061086e687763398401d84ef5d797c701d584828c61ae2ebe22')

package() {
  cd "${pkgdir}"
  rpmextract.sh "${srcdir}/lobehub-desktop-beta-1.132.4.x86_64.rpm"
}

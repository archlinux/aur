# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.132.9
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception')
makedepends=('rpmextract')
source=("lobehub-desktop-beta-1.132.9.x86_64.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-1.132.9.x86_64.rpm")
sha256sums=('b0f5adfb18091276fed7bdf02f770438018cd68c304c544814a615863a66a1b2')

package() {
  cd "${pkgdir}"
  rpmextract.sh "${srcdir}/lobehub-desktop-beta-1.132.9.x86_64.rpm"
}

# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.132.15
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('Apache-2.0 WITH lobe-chat-exception')
makedepends=('rpmextract')
source=("lobehub-desktop-beta-1.132.15.x86_64.rpm::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta-1.132.15.x86_64.rpm")
sha256sums=('48fa7aee6b6364407832f4b892f447f61e5975580fa356b7efef3e2283ce9b36')

package() {
  cd "${pkgdir}"
  rpmextract.sh "${srcdir}/lobehub-desktop-beta-1.132.15.x86_64.rpm"
}

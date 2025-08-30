# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.118.7
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('MIT')
source=("lobehub-desktop-beta_1.118.7_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.118.7_amd64.deb")
sha256sums=('037915a98b04324bdc88f9e6a39850744a6d3cb2a392a8f137717cdfdc76d456')

package() {
  cd "$pkgdir"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.118.7_amd64.deb" data.tar.xz | bsdtar -xJf -
}

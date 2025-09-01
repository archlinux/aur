# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.120.6
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('MIT')
source=("lobehub-desktop-beta_1.120.6_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.120.6_amd64.deb")
sha256sums=('1a07e0dbb6d57f4992f2318c522f29bb9c7ca8e8ccfa3d477b8bc077904919fc')

package() {
  cd "$pkgdir"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.120.6_amd64.deb" data.tar.xz | bsdtar -xJf -
}

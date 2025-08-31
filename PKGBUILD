# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.120.1
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('MIT')
source=("lobehub-desktop-beta_1.120.1_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.120.1_amd64.deb")
sha256sums=('d344ddc141896621738acce206758e39df516e1866c1bb522f9d96d34cb64464')

package() {
  cd "$pkgdir"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.120.1_amd64.deb" data.tar.xz | bsdtar -xJf -
}

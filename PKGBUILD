# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=lobehub-desktop-beta-bin
_pkgver=1.118.5
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Desktop version of lobe-chat, an open-source, modern design AI chat framework."
arch=('x86_64')
url="https://github.com/lobehub/lobe-chat"
license=('MIT')
source=("lobehub-desktop-beta_1.118.5_amd64.deb::https://github.com/lobehub/lobe-chat/releases/download/v${_pkgver}/lobehub-desktop-beta_1.118.5_amd64.deb")
sha256sums=('52ced6f21864f5dbc0671bb6db24df575a0a884709af9e79fbf0d02da4653afd')

package() {
  cd "$pkgdir"
  bsdtar -O -xf "${srcdir}/lobehub-desktop-beta_1.118.5_amd64.deb" data.tar.xz | bsdtar -xJf -
}

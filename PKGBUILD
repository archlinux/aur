# Maintainer: furistar <aur@mady.moe>

pkgname=stalker-gamma-cli-bin
pkgver=1.8.3
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('d76f208e36757817273cd7b4ebd7b418dd7cc47b206535a7c166369d344ade3c')
sha256sums_aarch64=('20a95a9a72a3e341627fd00f1396efb61f0e99445dce835711c7bf6c92d4eb4a')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "$pkgdir/usr/bin/stalker-gamma"
}

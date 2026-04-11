pkgname=stalker-gamma-cli-bin
pkgver=1.23.1
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('7a8aa1af909b17901e2c1dc7190c177243a6062e56f303403e7bb0b528a08321')
sha256sums_aarch64=('277646387c2424f6822cb4489802b1e6528035efa4946c26a4ccd3d129ee536d')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma"
}

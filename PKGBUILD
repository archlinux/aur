pkgname=stalker-gamma-cli-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('0c223a1def8e6a35b67ac0712ad5c8f0ba28a3e02c994f9979165a692e0df44e')
sha256sums_aarch64=('583ee754f8becd09dd8b030e68780ef44791b573409a5bb509b198daab7c28b0')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma"
}

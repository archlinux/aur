pkgname=stalker-gamma-server-bin
pkgver=1.39.0
pkgrel=1
pkgdesc="companion server for stalker-gamma-cli (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('fuse2')
source_x86_64=("stalker-gamma-server+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.x64.AppImage")
source_aarch64=("stalker-gamma-server+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.arm64.AppImage")
sha256sums_x86_64=('ae3eb5bb3b26015c2ce85caec0f480649cc4cdf6ccc6919e8df685d4a939ac5d')
sha256sums_aarch64=('157f19e51aaad4c4bec451aaaa3115a37d785188f6f0759a6fea9dab94804397')

package() {
  install -Dm755 stalker-gamma-server+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma-server"
}

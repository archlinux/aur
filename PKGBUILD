pkgname=stalker-gamma-cli-bin
pkgver=1.38.0
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('a9967fbf093d1b6265e7cf7eacff3fdef6bb40fc9e1d019eedea4269a0f1aba1')
sha256sums_aarch64=('542e9bfdd299f2d07428f7a99f9f63fbfe8b440601c3bde7f48088497c758df3')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma"
}

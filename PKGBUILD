pkgname=stalker-gamma-server-bin
pkgver=1.41.1
pkgrel=1
pkgdesc="companion server for stalker-gamma-cli (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('fuse2')
source_x86_64=("stalker-gamma-server+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.x64.AppImage")
source_aarch64=("stalker-gamma-server+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.arm64.AppImage")
sha256sums_x86_64=('79038e46d69147b32011420c3095ab0f4b6dea066b30eb57b70828904d1f2674')
sha256sums_aarch64=('871ef45b48b4bb6107fb7b8d06de30fa02770df8f2f786e4493f279f7109211d')

package() {
  install -Dm755 stalker-gamma-server+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma-server"
}

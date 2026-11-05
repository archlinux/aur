pkgname=stalker-gamma-server-bin
pkgver=1.41.0
pkgrel=1
pkgdesc="companion server for stalker-gamma-cli (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('fuse2')
source_x86_64=("stalker-gamma-server+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.x64.AppImage")
source_aarch64=("stalker-gamma-server+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.arm64.AppImage")
sha256sums_x86_64=('34fb835d079b71e203819add17fcc0cd5f37f0f9d193cec28375fedf11ab4fcb')
sha256sums_aarch64=('731def53a9f4abb243ca77ee4e941b911898c78b925ceacece2fc46fda00222c')

package() {
  install -Dm755 stalker-gamma-server+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma-server"
}

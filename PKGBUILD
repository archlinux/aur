pkgname=stalker-gamma-server-bin
pkgver=1.46.0
pkgrel=1
pkgdesc="companion server for stalker-gamma-cli (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('fuse2')
source_x86_64=("stalker-gamma-server+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.x64.AppImage")
source_aarch64=("stalker-gamma-server+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.arm64.AppImage")
sha256sums_x86_64=('5854478983175eeb22ff667bcdcc766c9b2efcc5e747618867505c318ab16361')
sha256sums_aarch64=('b3e027b1dc8256967aab45c64ceedfdc5898050e1d81df5cd2db8802d062aa3c')

package() {
  install -Dm755 stalker-gamma-server+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma-server"
}

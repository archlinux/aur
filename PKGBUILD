pkgname=stalker-gamma-server-bin
pkgver=1.42.0
pkgrel=1
pkgdesc="companion server for stalker-gamma-cli (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('fuse2')
source_x86_64=("stalker-gamma-server+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.x64.AppImage")
source_aarch64=("stalker-gamma-server+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma-server+linux.arm64.AppImage")
sha256sums_x86_64=('f2d297957e4c53192459317cde909b6d470ca435a6d22cd0831782ed5e526ee5')
sha256sums_aarch64=('73b4a34f2e683ed03a5bda7a5c731fbe13b001320adc2eff254c4efbefb909c7')

package() {
  install -Dm755 stalker-gamma-server+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma-server"
}

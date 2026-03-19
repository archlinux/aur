pkgname=stalker-gamma-cli-bin
pkgver=1.20.4
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('7a791698fa1c8109a8c6c096d4991a112907db70f143eaa9b49d292989afc045  ')
sha256sums_aarch64=('8bc0900a3ec5365b0fc80a342d9d1119b5e1a7b875d84480fdb144e71d041ed6  ')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "/usr/bin/stalker-gamma"
}

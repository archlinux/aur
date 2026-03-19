pkgname=stalker-gamma-cli-bin
pkgver=1.20.5
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('2c8bd917441d2d83d1e73cc7aec73b08c86ca05e35fa14813e8d6e730c7fbb5a')
sha256sums_aarch64=('a619bcd8ddf0a61abe84e3c2068c31ae6b899ce872a9ed74f1cdf51c7dbd85fa')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "/usr/bin/stalker-gamma"
}

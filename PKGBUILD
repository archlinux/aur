pkgname=stalker-gamma-cli-bin
pkgver=1.34.0
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('11b7185c8eef310d2f49ce229a2f2870f05331ff117044f483d7986c414ae87f')
sha256sums_aarch64=('44f4a7e00a1599eddcada2cd38643fd0b010bfa034c7687033e19b20a77615c8')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma"
}

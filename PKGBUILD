pkgname=stalker-gamma-cli-bin
pkgver=1.28.1
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('76ff47dcfcc1438299561625cc8717ebd29e49c94a869ffac7ae82bdd49512be')
sha256sums_aarch64=('6f53103f920dbe4fb964cafe59fb11edb164bca7b2b2af409a8c1ce55e5c4778')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "${pkgdir}/usr/bin/stalker-gamma"
}

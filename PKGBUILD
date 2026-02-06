# Maintainer: furistar <aur@mady.moe>

pkgname=stalker-gamma-cli-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('50d4ce008b619e6cc37597e0b33e1e5e0fcd51e03d3b18c0ca8e0831aba001e3')
sha256sums_aarch64=('60d56f44fdf031d741f0c09f6b59c72e16cde9d2a94a685cc01b03bda15c0441')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "$pkgdir/usr/bin/stalker-gamma"
}

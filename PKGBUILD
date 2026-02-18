# Maintainer: furistar <aur@mady.moe>

pkgname=stalker-gamma-cli-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('2dfcab57985acf84155e7c46f5e069dd2c41651160c57e3b1c8aa153479bfe5e')
sha256sums_aarch64=('eb22623dc6164639d0e5abe6cbff02ef38a46a567688b2ae42794dfef1256470')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "$pkgdir/usr/bin/stalker-gamma"
}

# Maintainer: furistar <aur@mady.moe>

pkgname=stalker-gamma-cli-bin
pkgver=1.8.2
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('f9921f2306cd0f9b432bd52f004fbc5c88a1bf4b936e01e5f8a1ad4d8d57a12d')
sha256sums_aarch64=('66945aa63550ac9455c4c6236e790b0568526770dfdf84b482101c2da89751ce')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "$pkgdir/usr/bin/stalker-gamma"
}

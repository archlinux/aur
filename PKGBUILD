# Maintainer: furistar <aur@mady.moe>

pkgname=stalker-gamma-cli-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="a cli to install Stalker Anomaly and the GAMMA mod pack (appimage)"
arch=('x86_64' 'aarch64')
url="https://github.com/FaithBeam/stalker-gamma-cli"
license=('GPL-3.0-or-later')
options=(!strip)
depends=('unzip' 'fuse2')
source_x86_64=("stalker-gamma+linux.x64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.x64.AppImage")
source_aarch64=("stalker-gamma+linux.arm64-${pkgver}.AppImage::https://github.com/FaithBeam/stalker-gamma-cli/releases/download/${pkgver}/stalker-gamma+linux.arm64.AppImage")
sha256sums_x86_64=('96a0b57911c51b8414d867cb7b940da40056054aecef7214efa91523511e3c9f')
sha256sums_aarch64=('f0a9c2612941eb2da854807383f6de5905a2448fa21fc0657a75b792ea1ac454')

package() {
  install -Dm755 stalker-gamma+linux.*.AppImage "$pkgdir/usr/bin/stalker-gamma"
}

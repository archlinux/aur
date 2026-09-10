# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.137.0
pkgrel=1
pkgdesc="The Visual Studio Code Server is a service you can run on a remote development machine, like your desktop PC or a virtual machine (VM)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: Microsoft EULA')
provides=('code' 'vscode')
conflicts=('code' 'vscode')
source_x86_64=(code_cli_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-x64/stable)
source_aarch64=(code_cli_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-arm64/stable)
source_armv7h=(code_cli_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-armhf/stable)
sha256sums_x86_64=('c0d98ef128778b6d1df3d76aee697a3caf839c2c093f0b84dc2a7d07c9d001d6')
sha256sums_aarch64=('75f5fd77ad12ef6470c15be8208581612b167dc3f42d64b29ef4e7de83ebc744')
sha256sums_armv7h=('f0a017432f094e35a21391d1d9a0665f6dddda6044b4bce1e2e04db1343588db')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

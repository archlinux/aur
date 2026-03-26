# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.113.0
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
sha256sums_x86_64=('d63e9e2c58a20f123bed88a8385d60fbb56b3ace06454bb1c9bc4339fa2bf682')
sha256sums_aarch64=('dbf48aac1f1eddf7d73db418d290cea01b80be3bbc186b3eb9c7080b687727c5')
sha256sums_armv7h=('111b4617a04b2cb7b1d76f67e8689c4ef45ebbaec8a2d5a712c04581c243124d')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

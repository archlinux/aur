# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.105.1
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
sha256sums_x86_64=('e1a774fec46f8ca0c548dc906de440b27df5dcb3a6014538c5d0eb627a0226a2')
sha256sums_aarch64=('2f5bf6ea9dc8079f52612ed5e5899738bc615c6d4db4cd986af0dd5d3c3e9907')
sha256sums_armv7h=('3836069fe2adae1c51f23930a80ddc8005b69f4633696fc1677989ac857a8842')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

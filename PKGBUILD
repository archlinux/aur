# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.145.2
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
sha256sums_x86_64=('12dfe0c26bc03ff8862dc4208fef105db518a7026b5ad652b158d70424538b90')
sha256sums_aarch64=('282dbd5e20bd1fcf4bc4b77c61c309795915075db0fe8680f9c1958b4c6b1b0a')
sha256sums_armv7h=('b21ff69917f82f0cfd435bf9c72c7273c143b441610ccc04b0a55c4d5382569e')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

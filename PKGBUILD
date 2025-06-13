# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.101.0
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
sha256sums_x86_64=('e5c6d8e350cf5c6c82af799cdf434ae998a5eb39fe54d821c850d8f9971daead')
sha256sums_aarch64=('97b1f372294e8bd56a540d49d3224c92678a16cbd1d44178acf52f4ff2d81b36')
sha256sums_armv7h=('df9084d6b23c16cbe4978e22db0f489321f6c778f49b52628d68ef16b5e13556')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

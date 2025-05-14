# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.100.1
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
sha256sums_x86_64=('012e196b45f1ec54eb23ee0d906e86866b57babf578a88603febd6d5bf0628df')
sha256sums_aarch64=('980c441ce3ab9e3f26da725ddc6719b59d7682d3a2824d12548e929fdd20bcce')
sha256sums_armv7h=('f42ae97904db0fdd4a05d0d8ccf80d79a12a0e2bdfb9f16545c4b2380f5ff316')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

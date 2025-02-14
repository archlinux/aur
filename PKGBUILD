# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.97.2
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
sha256sums_x86_64=('31a2a6eca4e12f7f4a6abffafb18e58f213ca815905739126a527ef92d6a2fe8')
sha256sums_aarch64=('62648f1d71ea54205ceca4a5edaa646179c889b579b55911996790d2dec5b994')
sha256sums_armv7h=('cf198beb19d5fc8fa42f939b52b9ce78ad2ce09e3590fefacf5e456f637d90eb')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

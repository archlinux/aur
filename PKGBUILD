# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.104.0
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
sha256sums_x86_64=('c52acf67f1629e93b24cb2edc54672102d037ffe7c23635a8fc2c71f322084bc')
sha256sums_aarch64=('bda302ca61472f7faeafbed0a43e492bf1cdf7f17c4b8510a30146891fd25195')
sha256sums_armv7h=('efc8ca07d3ecc952674d838720aec8fd5d479ac662b2fafb419aa9cb9ce691b9')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

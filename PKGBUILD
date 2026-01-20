# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.108.1
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
sha256sums_x86_64=('e37a32901fe6aaab05c1f920f007829a8db9f8e800cef2d3879127e523e58c49')
sha256sums_aarch64=('9339fd7d24c164568c55a9f0acf11207abeeca1fb80d360c81f893cc11a6eb59')
sha256sums_armv7h=('0dfca607f2ef044573350d173faee7bf4be3f7bd95de9cbd831ca5fcd7f5d73b')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

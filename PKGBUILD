# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.104.1
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
sha256sums_x86_64=('5cbb737d5ce414a0dc8ee62f92e2b8ea1e3b6da5f86c9fcb3eeb619a01e9c78c')
sha256sums_aarch64=('46237a5bf5ad90d8658bc655039f31a001fad60a1747e0a4598767c906e9c689')
sha256sums_armv7h=('64c12d44d30945f4689250b09974df2e8392ba35afa91d802b774346d8edd3e9')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

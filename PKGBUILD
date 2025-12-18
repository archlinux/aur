# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.107.1
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
sha256sums_x86_64=('9b898622a18d7e795b5d4d9cc05e317e4df9c3d44a5037f285779877d8c2650c')
sha256sums_aarch64=('f3b9d0c66839af1812a65e52834cbd296b66906f5f1fa25b3398f3a6aaa11378')
sha256sums_armv7h=('a254e5eb0805e629fa711e0bdc3a6330096e1961e99633d9dcf15ba4185b02e8')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.105.0
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
sha256sums_x86_64=('5a4feb7f19bd36ed591f7f8d0716541cfec359d3acceb1852fedb171ae48fb0b')
sha256sums_aarch64=('5263079cc9c461633d8e0c1162c223f1c1074e2bc7d3f3c57240505c4fd4f99f')
sha256sums_armv7h=('a687fd10fb7249302632839f7314b43d622c22744ad254ce67a5c07f017f388f')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

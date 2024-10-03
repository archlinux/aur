# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.94.0
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
sha256sums_x86_64=('9b052d43ae2311c2714f2426370ecca27e32a8ee76116ea0b523d810060ffe92')
sha256sums_aarch64=('9c019d8bf504fc2d3c7fcf4dfd34f00ba84e5a49760a30c4cf50b6459abfe087')
sha256sums_armv7h=('dbc9ee9220bb0fbc31e08cceb201c06fefd15e50142a275522dc2969c6dc8e4f')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

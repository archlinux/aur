# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.93.1
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
sha256sums_x86_64=('582c1ac89a2b8470740ce3f17a22d0e8589c405854bbd22411d539f91f4d3ee7')
sha256sums_aarch64=('18eaba04f2240bf7cb0e5cd7fad5720027fc1d5e89401d232c4fe31dcb6d4317')
sha256sums_armv7h=('89d80da8f37364d23540b1b27de726d51607e455dcc170281c3e0929f8842410')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

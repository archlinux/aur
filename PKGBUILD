# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.99.0
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
sha256sums_x86_64=('2e0aa016e08d02232c00c24854d38dd99fe0e465e580bffca542c7591b13c104')
sha256sums_aarch64=('33875a80dc9e70f9d547094db7165e0f7e78c95d2d19e338c59ed6f229e32d95')
sha256sums_armv7h=('ae6b6bbbfe4d2fcb891af37e5139f98ab1b63e4cc9585f87b255fb01693c36ae')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

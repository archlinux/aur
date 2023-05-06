# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>

pkgname=visual-studio-code-cli-bin
pkgver=1.78.0
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
sha256sums_x86_64=('4e3853648cef37c0c767c4c33a192cf9bf9453cdc307591a66e0d5896b4a4581')
sha256sums_aarch64=('1c3b762705723aa52455c12b156005c7a2c8be831aedef5904f2eecd4e6bf77f')
sha256sums_armv7h=('f3a52d5574af67f854c4b15085a4e5cb8641323bbdead1db70740c933c33403c')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

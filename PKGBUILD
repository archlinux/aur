# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.100.2
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
sha256sums_x86_64=('9c5c08379e4783a27cfd1b8ff0e1e9ead29d958280420a923a5a4b47a66559d3')
sha256sums_aarch64=('1fe9799c2e75837ef45cd735c5ee5bd5816a824e262eddc84e890f5c7ea0f7b7')
sha256sums_armv7h=('e0994a89c4931f79008e8f7bfed27f44e343f723d0599f1a235cc3811487ec6c')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

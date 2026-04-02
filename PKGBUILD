# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.114.0
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
sha256sums_x86_64=('841acb943ffa01719fcf1103358b2a5aeddca35ddcc40880f372391a6b70f9ab')
sha256sums_aarch64=('5eb6703b9db01016b46194612cd5b1e3bec6bd4fece6186f6570585978a050e4')
sha256sums_armv7h=('0607eaed164653d43afcfa2cbcf0cbe20b0a3738630bb639a427e25b2c6a9af3')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

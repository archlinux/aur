# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.104.2
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
sha256sums_x86_64=('4563f98b088bed28472e26de75d0cbd2cb7d3bbcce270a7ed42ba1191e5a7eda')
sha256sums_aarch64=('603a6fea69deca7701ffed27ec959ed1fe14da87c30cc17f41829c8b8b8da004')
sha256sums_armv7h=('3357d360dd66e4a96c0526997d97f117be07b59d09291108e6b25a0b5a60ca8a')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

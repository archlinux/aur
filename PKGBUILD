# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.128.1
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
sha256sums_x86_64=('5184a147ae8f213231b8966c1ff8b89eee77ac57589599ad49f372092cf4cca6')
sha256sums_aarch64=('0d41236ad7b4a70f86db692132b4ba8c5c6514ec71f2bf0d550acd2b7cd5180e')
sha256sums_armv7h=('1ae01c2d3b3c43edea21ec2a45efb5445788030e3277b43955eaf5a1112b4c99')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

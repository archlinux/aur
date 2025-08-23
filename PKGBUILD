# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.103.2
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
sha256sums_x86_64=('94c78e96d7ef737982cebb4cf8eaa7fd48cce0b16e93d0da5071c6548d0ad221')
sha256sums_aarch64=('881737fad33306e40d585ad8be4b1ab26db70b6fcdf0e7a3c1a16a0c3f6d0065')
sha256sums_armv7h=('bd8bb113a74a9c599d49fb3646465d61df88db1477e77d60d8029afeb075b017')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

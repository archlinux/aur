# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.90.1
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
sha256sums_x86_64=('96e244d38ffa4783f3a746c5c4f9f1f9a01c850eacdc6deab1b1a257f8078c55')
sha256sums_aarch64=('ba7acc1f1d266244b90a73e2ab6d5890ddb47201977db8af79da9b343baccee8')
sha256sums_armv7h=('2dabb4d4f873113590cb78786d6019c379e78cd0c276a2f5fefbdf5317d5a151')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

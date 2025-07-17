# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.102.1
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
sha256sums_x86_64=('7c8afdad55c4d1abded1fa0fd9fd95d208e8f30351df71f8b9a245fe7a0970ec')
sha256sums_aarch64=('d6c17cd283d07f227c0964895b5a3a4fdc7d259e23237a24b0e0328c187aa18e')
sha256sums_armv7h=('00ff04fd8574c1aacda3a06f0ceb34ef48366b008e6e7ef6757e071d8f2bdb2a')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

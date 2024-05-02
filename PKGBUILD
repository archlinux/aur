# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.89.0
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
sha256sums_x86_64=('adb36366a8cef3ff34a29a0be2ea13b2befa495a7be29a3bb38fdc14323e4852')
sha256sums_aarch64=('022e156720db0b75636b6af701c64f7913cf5e10f451081eebdaf95b6e76cd0a')
sha256sums_armv7h=('c34fecfbc225497509d65c88cb0951ebaf9672cdce69a8b3e28c4b38b46a373a')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

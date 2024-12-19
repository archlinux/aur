# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.96.1
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
sha256sums_x86_64=('9cb198ff63b602acadbe6bb49841240c7578e6ec2e6009a69e63328a7fb54ab1')
sha256sums_aarch64=('eedb1293381c9241bded5e429769fe67fdebe863f13c3f7c8e8ca1e7afe80ce7')
sha256sums_armv7h=('fefc2bd3b57e7e5680bae82c010b35ba91a20cb85e602e565cd26fd020a2a18d')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

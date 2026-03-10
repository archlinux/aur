# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.111.0
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
sha256sums_x86_64=('97d58894ed958cef0c21b3784bea498c8ff3e6738aa4e5cc2aeed158006e2523')
sha256sums_aarch64=('39f3cb2ea5848c13c4c65f241c4bfa531a7a90fbda9a30807b1073368306a4bc')
sha256sums_armv7h=('700fefa9849b95cdf44b688d5ae9e87e67db9726ef423cc7f0a4248639742a28')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

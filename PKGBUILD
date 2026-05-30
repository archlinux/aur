# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.122.1
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
sha256sums_x86_64=('f31a989ab50525fff1b28121d1f05763730d9e8159254c4dca2c092705348b63')
sha256sums_aarch64=('be594a4f4405cf2d45e3522a0e36a5f69166f26497f3313115e5c20c4cdbb11a')
sha256sums_armv7h=('6b205362552d0910342a09a1cdf5913f5d0b67dd4ff5bcbdd3e0748a52a14daf')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

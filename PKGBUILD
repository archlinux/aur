# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.96.2
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
sha256sums_x86_64=('3037493fe7e54a4945a0b112a1e40ca7345988db5c86db8f1d75eec4d4b2571b')
sha256sums_aarch64=('8ee2e2f3477a8f058aa78f9f315db71269318cae85cc974a03f2e2dd0440af9d')
sha256sums_armv7h=('4915447ff14b31d592fe135229ed536c13de21dd0f0dddfec72a53040044917c')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

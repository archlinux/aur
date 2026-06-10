# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.123.2
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
sha256sums_x86_64=('f42dbdb4c0b091bc14ff74f3fb518b2bda1f154427f409d2593c10632d941256')
sha256sums_aarch64=('84e3c28709f8c495cbbdc938089aa284ad4935b33ea10170f50ea4f1b3a0affc')
sha256sums_armv7h=('f6ab0829d03148ca47ab7a4ad9c9668e0f69c57af19a42d1f6338e39e360cc53')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.128.0
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
sha256sums_x86_64=('b74d507b8a062c34f1fb4197858fe8d35aab2eaca93ca22abe7b3f416c49d920')
sha256sums_aarch64=('58fe83c28a7cb88400416f19be927e4dffc4bd5fa4a44522e6aafd2a7b110e71')
sha256sums_armv7h=('f4b572b5d2f77957aa77c1727ff07cc43fed83f69d680d75c403491f7c1d1406')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

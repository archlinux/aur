# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.106.1
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
sha256sums_x86_64=('aa83763e698ae84e27674f51ee8e27fe0f4ed835a101e4c1440f9d3171476fe2')
sha256sums_aarch64=('a5153b6dc35f93e88c4b1b9139deaac2ee5c3982bd9fd18e6064aa2c1d8c09c2')
sha256sums_armv7h=('e3362dd98711a5fc56dfab58d558957caca0ed5118d565cbc4e3da51cfe8b50d')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

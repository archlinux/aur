# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.143.1
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
sha256sums_x86_64=('22da21dfa7051bf3a0f048cd7e875c4fe582ddd3e8451cd17a725d199029a9fe')
sha256sums_aarch64=('f59bfe13d044cdd19bf1673d16597d9086d28ee508d6d4a9d89082c93902bc69')
sha256sums_armv7h=('5125edf4750c3bf158d1945afbad582b0f7bbf7714af268429249df613bdde3b')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

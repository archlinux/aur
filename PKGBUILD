# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.87.1
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
sha256sums_x86_64=('a47f62e9c8e908721eef66a6df7a5bfcdfa1b9515776e941f3aa5b2adc520dac')
sha256sums_aarch64=('7f4ae7a0a7e48d213e942dd48a2b0cf30c0c651a6e493a42b2b3fd270ea516d0')
sha256sums_armv7h=('0f797a93682fa1d44542d1a993674abe612baeac0873c4e271462046d52b3573')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

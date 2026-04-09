# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.115.0
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
sha256sums_x86_64=('3a36228691e540b9a1e5798c5e5738ccabff7bc4a83bd030a8f7b0cce6045426')
sha256sums_aarch64=('2f5bf88869e85b01607ef8f49620e824299333a7b82fe8c073faa1a4cc1e47c0')
sha256sums_armv7h=('4615f5534e4c7b73ce245cd4bffcd9633a5a0519acfe6df1c8d22e8295d8cfd2')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

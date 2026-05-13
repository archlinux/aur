# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.120.0
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
sha256sums_x86_64=('fe8738912b715f1cf3f6d36882fe5535209f00c69ed785994afd8c14204f4018')
sha256sums_aarch64=('0e7bd2f16abe576316b19491fd57ed7d240f8d79f4c9fd46e8a2d68a94567c3a')
sha256sums_armv7h=('f090700b26bfd11250fcf8ee195d295e4686cb65298b4f7c19dfb3037fe49d06')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.97.1
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
sha256sums_x86_64=('f5f26e3ba6fe38b0afc5554d5d649584858f0da62bbf8bc628d1c630ddc12cbe')
sha256sums_aarch64=('4f8ca21eb153ecd203f51392d46af34c58ec1f6f43d9251e9aab6978c9df7bc2')
sha256sums_armv7h=('7b365f2c7100d45751b5f443ee8f13c09f22fee9f0bd42b70a489622d766e199')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

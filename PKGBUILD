# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.102.3
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
sha256sums_x86_64=('1d4d1b731edd09fb95d7792e0776b99cf41830022d5a66017953b316f31ca306')
sha256sums_aarch64=('6caf2c58bab68079ea7c7b1545b7e9ce9722afc34e4f98a400d24e6ace3444ef')
sha256sums_armv7h=('2c4f93d40600c145542128b3b2587e6ddee2a405aca5f78f8e4d93a11720ff27')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.124.0
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
sha256sums_x86_64=('a1b1f0668975c405b904668ff8881297136be07fa78d17f53a59a5b01dcd048b')
sha256sums_aarch64=('c3781aea1ee2987492f1fb05a9fb11bd6b870ea48b69d571546f746bcceace21')
sha256sums_armv7h=('57dfbd5b96e23ee894e48c606e2d29a242eadabae509e74b9934babb54d8ef78')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

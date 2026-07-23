# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.130.0
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
sha256sums_x86_64=('e673d01efc0fd6280013812f9404b7b1e270cbce6810f092cfabbdc3f8c7f549')
sha256sums_aarch64=('ac553e7917f7e1a4a8b368d6f7710273b9eef9ddcfdb0a8276b13c2092c38a69')
sha256sums_armv7h=('b783956af2412a10c021bd3bd969d9b2e13f26a83fdcdab1db4c9a5927846faa')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

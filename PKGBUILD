# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.106.3
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
sha256sums_x86_64=('d8300ce8702cc81f65c27ffe83a1225321bf46f85b52a3e71ce6635ee7287b1b')
sha256sums_aarch64=('89a0a0d73f24750d6123d7bc8e24986d26e68eb1b0ae5e0751a23e766c25ebdd')
sha256sums_armv7h=('c814f4359cd5e0ad5c6e78ca37f4227d02664c5200cf36aa6a3242312e2756bc')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.92.2
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
sha256sums_x86_64=('cc5268b043bf3fb644f59318a4174bbe29d8df1df72fd3a3d79b30afaaab235d')
sha256sums_aarch64=('8534a8dc8acf3132cfed000e29248a5159ffbcd7aa3b149fda1c057d5bc6a1ab')
sha256sums_armv7h=('6cca449b11d06a8acc25bcc03248db21fe580ddc771e33c263c1c6cc9d50f6e0')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

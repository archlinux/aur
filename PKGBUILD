# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.139.1
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
sha256sums_x86_64=('e079ddb70377cca515ab0cf5ca1ee4095a14e1f510af4b10a75b01c6018f9f02')
sha256sums_aarch64=('5bc80c3622a628a8aee4be15967bdc7a039235d867c3d1bedf1b373d2d731dc7')
sha256sums_armv7h=('efedf174d86463178c4335d5b886bcc9a5a2f3bbb8c265c815b553bdad3cdd81')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

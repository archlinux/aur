# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.96.4
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
sha256sums_x86_64=('7922128d24292f6ed926ce22a36fad9cf6a1e44106a832193b47406d5c0ad798')
sha256sums_aarch64=('045f94634afa682dc3e8978d405a9e0e47ed7e6606a5af3bf7f561cfa06b793c')
sha256sums_armv7h=('3e5fb7f96e53322cb2dcd709c6f7d027787843ffdf50ea9d928149428372bebe')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

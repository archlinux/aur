# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.141.1
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
sha256sums_x86_64=('3d59e9e29b184a84b752f2b42fb888643cbaef80c69222dec9aae273fc45ade1')
sha256sums_aarch64=('f3ef2767b0b0823e617220d7a084a0f62ed74e1ae18ce9b50ec49b45345e5b61')
sha256sums_armv7h=('1fcfa6f6a4db2e79508fa84a6abad091c4b6a9ece66dee5d18d53e16ea53d9b8')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}

# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.124.2
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
sha256sums_x86_64=('c4a46816b9f793ccdcdf610c2ee050178be63c0978bfe1328e62552e9a093abb')
sha256sums_aarch64=('76e692f0a4e22a7ba5662a65d9fb716a27fc857f5f736e5b2d584726ae8e5f4b')
sha256sums_armv7h=('0f41ad6b91896015879f2b21e72c0bccfad7aa3896ec7997362f93468e292333')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
